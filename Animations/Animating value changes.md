For visual changes that are triggered by a changing value in a View, there are three different approaches to animate the change:

a) Apply the animated view modifiers selectively inside a view-modifiying-block using `.animation {}` (preferred method, because it's most precise regarding what animation gets applied to what):

![[AnimatedValueExample.mp4|300]]

<<< @/Animations/AnimatedValueContentBlockExample.swift

b) Use the `.animation()` modifier to trigger an animation when a value changes:

<<< @/Animations/AnimatedValueExample.swift

Watch out for this potentially-surprising-behaviour: Inside the View that is modified by `.animation()`, all changes that happen in the same "view update cycle" together with the value change, will be animated. Meaning, when other values change at the same time, these will be animated as well:

![[AnimatedValueGotchaExample.mp4|300]]

<<< @/Animations/AnimatedValueGotchaExample.swift

c) Wrap the value change in a `withAnimation {}` block (it's best to avoid this style and consistently use value changes to trigger animations):

<<< @/Animations/WithAnimationExample.swift


---

For animations that are more than View changes based on value changes, see [[Controlled Animations]].
