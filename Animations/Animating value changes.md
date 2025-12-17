For visual changes that are triggered by a changing value in a View, there are three different approaches to animate the change:

<iframe width="560" height="315" src="https://www.youtube.com/embed/RsK5R-c9tUc?si=RMXSfqsETjyHK3vQ" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

## `.animation {}` {#animation_block}

a) Apply the animated view modifiers selectively inside a view-modifiying-block using `.animation {}` (preferred method, because it's most precise regarding what animation gets applied to what):

![[AnimatedValueExample.mp4|300]]

<<< @/Animations/AnimatedValueContentBlockExample.swift{16-19}

## .animation(value:) {#animation_value}

b) Use the `.animation()` modifier to trigger an animation when a value changes:

<<< @/Animations/AnimatedValueExample.swift{17}

### .animation(value:) Pitfall {#animation_value_pitfall}

Watch out for this potentially surprising behaviour: Inside the View that is modified by `.animation(value:)`, all other changes that happen together with the value change in the same "view update cycle", will also be animated:

![[AnimatedValueGotchaExample.mp4|300]]

<<< @/Animations/AnimatedValueGotchaExample.swift{29-31,24-25}

## withAnimation {} {#withAnimation}

c) Wrap the value change in a `withAnimation {}` block:

<<< @/Animations/WithAnimationExample.swift{21-23}

## Pitfalls

The animation modifiers have subtle pitfalls. The most conspicuous one for me is that  `.frame()` is not animatable; one should use `scaleEffect` instead. This article by [Ole Bergmann](https://mastodon.social/@ole@chaos.social) points out a few more pitfalls: [When .animation animates more (or less) than it’s supposed to](https://oleb.net/2022/animation-modifier-position/)

## Other Animations

For animations that are more than View changes based on value changes, see [[Controlled Animations]]. If it's a View appearing or disappearing, see [[View Transitions]].

## Links

* [SwiftUI docs: Animation](https://developer.apple.com/documentation/swiftui/animation)