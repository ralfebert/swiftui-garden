---
date: 2025-09-06
---
A primer on animating the appearing and disappearing of views using transitions in SwiftUI.

![[swiftui-transitions.png|550]]

## How do the .animation and .transition modifiers relate?

1) When a value change causes a View to appear or disappear (it is inserted into or removed from the view hierarchy), ...
2) and an animation is applied to the change with `withAnimation` or `.animation` (see [[Animating value changes]]), ...
3) by default, SwiftUI animates that change with an `opacity` transition (fade in and out):

![[default_transition_example.mp4|300]]

<<< @/Animations/DefaultTransitionExample.swift{15,22}

The `.transition` modifier allows to configure the transition effect. It is applied to the element that is inserted or removed. Without an animation for the triggering value change, this modifier is without effect. Example using `.transition(.blurReplace)`:

![[transition_example.mp4|300]]

<<< @/Animations/ViewTransitionExample.swift{14,18,22}

::: tip
**Recommended structure:** `.transition()` as last modifier in the if-condition block and a dedicated container around for the `.animation()`.
:::

## Triggering transitions with changed view identity

View identity `.id()` can be used to trigger transitions. If the id of a View changes, SwiftUI will see this as "old View removed, new View inserted" and if you change the id together with an animation, a transition will be applied. In this example, the old View is removed and the new View is inserted using the `push` effect:

![[transition_by_id_example.mp4|300]]

<<< @/Animations/ViewTransitionByIdExample.swift{22-23,23}


## Transition playground

Explore the built-in transitions:

![[transition_playground.mp4|300]]

<<< @/Animations/TransitionPlayground.swift

## Custom transitions

Custom transitions can be created by implementing the `Transition` protocol:

![[custom_transition_example.mp4|300]]

<<< @/Animations/CustomTransitionExample.swift{18,27-41}
