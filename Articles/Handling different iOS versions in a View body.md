
## Checking for iOS version / API Availability <apply id="checking-availablity"/>

In regular Swift code, you can use this to check for an iOS version at runtime:

```swift
if #available(iOS 26, *) {
    // ...
}

if #unavailable(iOS 26) {
    // ...
}
```

[↗ Swift: Checking API Availability](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/controlflow/#Checking-API-Availability)

## `if #available` in modifier chains

Unfortunately, you cannot use such an `if #available`-statement in the middle of a chain of modifiers.

As a solution, you can use this View extension:

<<< @/Extensions/SwiftUI+Modify.swift

Then use it like this:

```swift
List {
    Section {
    }
    .modify { content in
        if #available(iOS 26, *) {
            content
                .sectionIndexLabel(Text("..."))
        } else {
            content
        }
    }
}
```

::: warning
* Do NOT forget to return `content` in the else block or the View will be missing in the old iOS version
* Do NOT use this for other conditions that can change during runtime (static things like iOS version, "iPhone or iPad" are fine though). Otherwise the View hierarchy will change and state will be thrown away / transitions will break.
:::

## Custom View extensions, .backport

If you need the same modifier in many places, define a reusable custom view extension:

```swift
extension View {
    @ViewBuilder func compatibleSectionIndexLabel(_ label: Text) -> some View {
        if #available(iOS 26, *) {
            self.sectionIndexLabel(label)
        } else {
            self
        }
    }
}
```

Here is a helpful idea about that from [Dave DeLong](https://mastodon.social/@davedelong): Don't add the modifier to the View itself but to a wrapper View called `backport`:

[↗ Dave DeLong: Simplifying Backwards Compatibility in Swift](https://davedelong.com/blog/2021/10/09/simplifying-backwards-compatibility-in-swift/)

<<< @/Snippets/iOSVersionCompatiblity/BackportViewModifierExample.swift

Then use it like this:

```swift
List {
    Section {

    }
    .backport.sectionIndexLabel(Text("..."))
}
```

This has the advantage that you can use the same name for the modifier and can easily find all those places where such a modifier was used. This will be handy if later the old version is not to be supported anymore and the code can be removed.

## Tweaking values

To tweak values like paddings between different iOS versions, a generic function like this is handy (this is specific to an app that only supports iOS 18 and 26+):

```swift
public func value<T>(_ ios26: T, ios18: T) -> T {
    if #available(iOS 26, *) {
        ios26
    } else {
        ios18
    }
}
```

Then you can go:

`.padding(.trailing, value(0, ios18: 16))`


## Backlinks, Discussion

* [↗ How to use iOS15-specific modifiers in SwiftUI on iOS 14 and earlier?](https://developer.apple.com/forums/thread/689189#690630022)
* [↗ SwiftUI: using view modifiers between different iOS versions](https://stackoverflow.com/questions/68892142/swiftui-using-view-modifiers-between-different-ios-versions-without-available/69506048#69506048)
