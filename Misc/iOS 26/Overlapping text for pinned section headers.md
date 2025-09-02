I think SwiftUI should have better support to handle overlapping text for pinned section headers:

![[section-header-issue.png|300]]

> ### FB19434244 Mitigating overlapping text for sticky section headers for a plain List with .scrollEdgeEffectStyle {#fb}
>
> For a List with .listStyle(.plain),
>
> - for .scrollEdgeEffectStyle(.soft, for: .top), the headers should be un-pinned or there should be a modifier to make them un-pinned
> 
> - for .scrollEdgeEffectStyle(.hard, for: .top), the pinned header view should attach to the top bar and get a blurry material background, similar to a safeAreaBar()

safeAreaBar or LazyVStack can be used to work around this, https://developer.apple.com/forums/thread/795159
