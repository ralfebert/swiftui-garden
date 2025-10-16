
> ### FB19434107 SwiftUI Glass buttons for a Menu are shown with an odd offset/without shadow when the Menu is closed {#fb}
>
> When a glass button is used for a Menu (standalone - it works when it’s in the NavStack toolbar), when the Menu is closed, the Button is shown mis-aligned and without shadow for a little while, and snaps back to it’s correct position+shadow enabled after that.

::: info
Still happening in iOS 26.1 Beta 3.

This issue also occurs with a plain Button.

[Potential workaround for glass button](https://mastodon.social/@fabio@iosdev.space/115380125888156189)
:::

<video controls src="https://box-swiftui-garden.fra1.cdn.digitaloceanspaces.com/wiggly-glass-buttons-v2.mov" width="300"/>

<<< @/Snippets/JumpyGlassViewExample.swift
