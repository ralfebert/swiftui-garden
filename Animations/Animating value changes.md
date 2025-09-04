For visual changes that are triggered by a changing value in a View, there are three different approaches to animate the change:

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

c) Wrap the value change in a `withAnimation {}` block (it's best to avoid this style and consistently use value changes to trigger animations):

<<< @/Animations/WithAnimationExample.swift{21-23}


---

For animations that are more than View changes based on value changes, see [[Controlled Animations]].
