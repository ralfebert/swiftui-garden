I'm seeing a bug on iOS 26 where in a NavigationStack in a .sheet, after going back once, the transition from a view with opaque background -> glass background is broken when using `.containerBackground(Color.clear, for: .navigation)`. The old screen stops moving in the middle of the transition, stays for a little while, then disappears abruptly, as seen at the end of this video:

<video src="https://box-swiftui-garden.fra1.cdn.digitaloceanspaces.com/navstack_glass_transition.mov" controls width="300"/>

#### Workaround

Adding a .containerBackground to the opaque view in-between, too, works around the issue:

```
.containerBackground(.background, for: .navigation)
```

#### Bug report

> FB19016414: Unsmooth transition in a NavigationStack inside a .sheet when mixing glass and non-glass backgrounds
>
> When a view with a glass background transitions in over a view with an opaque background in a NavigationStack inside a .sheet, sometimes the view with the opaque background stops moving / stays visible during the transition and then disappears in an instant at the end, leading to a very unsmooth transition.
> 
> Still happening in Beta 8.
> This happens mostly when going back and forth in the nav stack.
> Steps to reproduce: Use the attached example code, go to the list of cities, select a city, go back, select another city -> you'll see the issue.


Example code:

<<< @/Snippets/StuckViewInBackgroundDuringNavStackTransitionExample.swift

#### Backlinks, Discussion

* [Stack Overflow: View Stuck in background during transitions in a NavigationStack with glass backgrounds](https://stackoverflow.com/questions/79759352/view-stuck-in-background-during-transitions-in-a-navigationstack-with-glass-back)