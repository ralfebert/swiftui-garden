`.transition()` animates the appearing and disappearing of a View.

When the condition that makes the View (dis)appear changes, an animation needs to be triggered, either via `withAnimation {}` or `.animation(value:)`, otherwise the `.transition()` modifier will have no effect (see [[Animating value changes]]). 

`.transition()` as last modifier in the if-condition block and a dedicated container around for the `.animation()` is recommended:

![[transition_example.mp4|300]]

<<< @/Animations/ViewTransitionExample.swift{15,19}

## Transitioning by identity change

A handy trick is to use `.id()` view identity to trigger transitions - if you change the id of a View, SwiftUI will see this as "old View disappeared, new View appeared" and if you do that before `.transition`, will do transitions accordingly:

![[transition_by_id_example.mp4|300]]

<<< @/Animations/ViewTransitionByIdExample.swift{19-20,23}