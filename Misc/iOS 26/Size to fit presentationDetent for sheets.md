> FB19359821 PresentationDetent to auto-size sheet to the height of the contained Views
> 
> I suggest a `PresentationDetent.sizeToFit` or `PresentationDetent.contentSize` that automatically sizes the sheet to the height of the contained Views.
> 
> This seems to be a common requirement for many app developers and it would be nice if this would be supported out of the box without fiddling around with the usual GeometryReader in background -> make available the height with a preference key -> .presentationDetents([.height(…)]) workarounds.

See also:
* https://developer.apple.com/forums/thread/795655
* https://www.reddit.com/r/SwiftUI/comments/1j8f5b4/animatable_autosizedtofit_swiftui_sheet/
