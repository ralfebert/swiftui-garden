For a List with .listStyle(.plain), I think SwiftUI should have an easy way to a) un-pin headers and b) to make pinned headers appear safeAreaBar-like, attached to the top bar.

Currently, safeAreaBar or LazyVStack can be used to work around this, see https://developer.apple.com/forums/thread/795159

![[section-header-issue.png|300]]

Update: 🎉 In Beta 8, if you use `.scrollEdgeEffectStyle(.hard, for: .top)`, the pinned headers appear attached to the safe area bar:

![[safe_area_pinned_headers.png|300]]


> ### FB19434244 Mitigating overlapping text for sticky section headers for a plain List with .scrollEdgeEffectStyle {#fb}
>
> For a List with .listStyle(.plain),
>
> - for .scrollEdgeEffectStyle(.soft, for: .top), the headers should be un-pinned or there should be a modifier to make them un-pinned
> 
> ~~- for .scrollEdgeEffectStyle(.hard, for: .top), the pinned header view should attach to the top bar and get a blurry material background, similar to a safeAreaBar()~~

List Section Header playground:

<<< @/Snippets/ListPinnedSectionHeadersExample.swift