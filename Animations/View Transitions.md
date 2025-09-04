`.transition()` makes the appearing and disappearing of a View animated. When the condition that makes the View (dis)appear changes, an animation needs to triggered, either via `withAnimation {}` or `.animation(value:)`, otherwise the `.transition()` modifier will have no effect (see [[Animating value changes]]). 

`.transition()` as last modifier in the if-condition block and a dedicated container around for the `.animation()` is recommended:

![[transition_example.mp4|300]]

<<< @/Animations/ViewTransitionExample.swift{15,19}