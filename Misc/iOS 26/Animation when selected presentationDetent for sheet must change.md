> FB19252983: Animation when selected presentation detent must change for a sheet because the current detent becomes unavailable
> 
> When using a .sheet() with .presentationDetents(), when the currently active presentation detent has to change because it becomes unavailable, this change is performed without an animation; I suggest to add an animation to this change, same as when the selected presentation detent is changed via Binding.
> 
> Steps to reproduce: Use the example code and switch from „Medium | Large“ to „Large“.

<video src="https://box-swiftui-garden.fra1.cdn.digitaloceanspaces.com/presentationdetents_without_animation.mp4" controls width="300"/>

Example code:

<<< @/Snippets/SheetAnimationWhenSelectedPresentationDetentMustChangeExample.swift