By default, the pinned section headers of a plain List appear overlapping the list rows on iOS 26:

![[section-header-issue.png|300]]

Update: 🎉 In Beta 8, if you use `.scrollEdgeEffectStyle(.hard, for: .top)`, pinned headers now appear attached to the top bar (same as `.safeAreaBar`):

![[safe_area_pinned_headers.png|300]]
To make section headers unpinned, a LazyVStack can be used as a workaround.

Discussion: https://developer.apple.com/forums/thread/795159

## List Section Header playground

<<< @/Snippets/ListPinnedSectionHeadersExample.swift

## Original issue

> ### FB19434244 Mitigating overlapping text for sticky section headers for a plain List with .scrollEdgeEffectStyle {#fb}
>
> For a List with .listStyle(.plain),
>
> - for .scrollEdgeEffectStyle(.soft, for: .top), the headers should be un-pinned or there should be a modifier to make them un-pinned
> 
> ~~- for .scrollEdgeEffectStyle(.hard, for: .top), the pinned header view should attach to the top bar and get a blurry material background, similar to a safeAreaBar()~~