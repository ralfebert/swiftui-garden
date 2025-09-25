---
date: 2025-09-07
---
Both `ConcentricRectangle` (new in iOS 26) and `ContainerRelativeShape` reducing the corner radius accordingly when insetted in a container shape:

![[concentricRect.insetExample.png|250]]

So what's the difference? Both need to come near rounded corners of an outer rounded `.containerShape`, but `ConcentricRectangle` needs to be near an actual corner and will only round that corner by default: (`ConcentricRectangle` in red, `ContainerRelativeShape` in yellow):

![[concentricRect.borderProximity.png|500]] 

The real difference becomes visible when moving the shape just in one direction a bit:

![[concentricRect.cornerExample.png|250]]

This shape is not that practical with only one corner rounded, but the uniform version `ConcentricRectangle(corners: .concentric, isUniform: true)` with all the other corners getting the same rounding is quite nice:

![[concentricRect.uniformExample.png|250]]

This is mostly useful to make views rounded according to the device bezel rounded corners because SwiftUI sets a container shape accordingly.

![[concentric_full_device.png|280]]

<<< @/Shapes/ConcentricShapeExample.swift

<<< @/Shapes/ConcentricShapeFullscreenExample.swift

#### Backlinks, Discussion

* [Adaptive automatic corner radius in containers with insets/paddings | Apple Developer Forums](https://developer.apple.com/forums/thread/794685)
* [ConcentricRectangle in sheets seem broken as of iOS 26 Beta 9](https://mastodon.social/@nicoreese/115158882770867696)
