As there is currently no [[Sidebar-like sheet on iPad]], I'm using a NavigationStack in a View with `.glassEffect` applied:

![](https://box-swiftui-garden.fra1.cdn.digitaloceanspaces.com/ipad_glass_sheet_sidebar.png)

Discussion: https://developer.apple.com/forums/thread/793627

This came with two issues that needed workarounds:

> ### FB19252414: Container glass background disappears when a Menu with a glass effect appears
> 
> When .glassEffect() is used to build a custom sideways sheet-like presentation on iPad, the glass background disappears when a Menu with a glass effect appears.

<video src="https://box-swiftui-garden.fra1.cdn.digitaloceanspaces.com/glass_background_disappearing.mov" controls width="400"/>

(this can be worked around by putting the glass in `.background` using `Color.clear.glassEffect()` )

Toolbar buttons in the bottom toolbar align with the device safe area instead of the NavigationStack container / are shown without padding inside the container:

![[toolbar_buttons_ipad_glass_sidebar.png|350]]

(this can be worked around by avoiding the toolbar and using a .safeAreaBar + custom standalone glass buttons)


Example code:

<<< @/SnippetsIPad/CustomGlassSidebarExample.swift
