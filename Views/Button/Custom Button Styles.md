A `ButtonStyle` is a reusable definition of the look and feel of a custom button. It's passed a configuration with the button label and returns the View for the button:

![[customButtonStyle.1.png|300]]

<<< @/Views/Button/CustomButtonStyleView.swift

## Button Styles with custom gestures

`PrimitiveButtonStyle` is even more customizable and allows to define the interaction behaviour / gestures for the button from scratch. [Example](https://www.avanderlee.com/swiftui/swiftui-button-styles/#defining-both-a-custom-button-style-and-interaction)

## Modifying existing button styles

The system-defined [[Button Styles]] can be extended by forwarding the implementation to their `.makeBody()` method:

![[modifiedButtonStyle.1.png|300]]

<<< @/Views/Button/ModifiedButtonStyleExample.swift
