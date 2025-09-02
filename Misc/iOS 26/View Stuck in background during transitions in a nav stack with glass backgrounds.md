> FB19016414: Unsmooth transition in a NavigationStack inside a .sheet when mixing glass and non-glass backgrounds
>
> When a view with a glass background transitions in over a view with an opaque background in a NavigationStack inside a .sheet, sometimes the view with the opaque background stops moving / stays visible during the transition and then disappears in an instant at the end, leading to a very unsmooth transition.
> 
> Still happening in Beta 8.
> This happens mostly when going back and forth in the nav stack.
> Steps to reproduce: Use the attached example code, go to the list of cities, select a city, go back, select another city -> you'll see the issue.

<video src="https://box-swiftui-garden.fra1.cdn.digitaloceanspaces.com/navstack_glass_transition.mov" controls width="300"/>

Example code:

<<< @/Snippets/StuckViewInBackgroundDuringNavStackTransitionExample.swift