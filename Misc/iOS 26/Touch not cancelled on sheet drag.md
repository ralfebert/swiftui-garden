> ### FB18927179: Button touch is not cancelled when sheet drag or scroll gesture starts on a Button inside a ScrollView inside a .sheet
>
> Steps to reproduce:
>
> - Use the attached example snippet: A Button inside a ScrollView inside a .sheet
> - Start dragging the sheet or scrolling with the finger on the Button.
>
> Expected behavior: After a little bit of drag movement, it should detect that it’s a scroll/sheet drag and the Button touch should be cancelled / the button action should not be fired. This behaviour can be observed when no ScrollView is present.
>
> Observed behavior: Button touch is not cancelled and the action fires, even when the gesture clearly looked like a sheet drag/scroll.

::: info
Still happening in iOS 26.1 Beta 4
:::

<video src="https://box-swiftui-garden.fra1.cdn.digitaloceanspaces.com/touch_not_cancelled_sheet_drag.mov" controls width="300"/>

Discussion: https://developer.apple.com/forums/thread/763436?answerId=849716022#849716022

Workaround:

<<< @/Extensions/SwiftUI+iOS18ScrollViewButtonTapSheetFix.swift

Example code:

<<< @/Snippets/TouchNotCancelledOnSheetDragExample.swift