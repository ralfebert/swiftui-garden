A `ButtonStyle` is a reusable definition of the look and feel of a Button. It gets passed a configuration with the button label and state and has to return the View for the button:

![[customButtonStyle.1.png|300]]

<<< @/Views/Button/CustomButtonStyleView.swift

## Custom gestures

`PrimitiveButtonStyle` is more customizable and allows to define the interaction behaviour / gestures for the button. [Example](https://www.avanderlee.com/swiftui/swiftui-button-styles/#defining-both-a-custom-button-style-and-interaction)

## Modifying existing button styles

The system-defined [[Button Styles]] can be extended by forwarding the implementation to their `.makeBody()` method:

![[modifiedButtonStyle.1.png|300]]

<<< @/Views/Button/ModifiedButtonStyleExample.swift
