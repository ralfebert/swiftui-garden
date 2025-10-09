Conditions in View modifiers can be dangerous: When the condition value changes at runtime, the wrapped content view will lose its identity which can cause lost state and fire transitions. This snippet demonstrates the issue: the inner view (stepper counter) will lose state when the outer condition (isBold) changes. Because of this, many SwiftUI modifiers have a nilable/Bool parameter. Here, `.fontWeight(isBold ? .bold : .regular)` or, on iOS 26+, `.bold(isBold)` should be used instead:

<<< @/Snippets/ConditionalModifierIssueExample.swift

See also:
* [Why Conditional View Modifiers are a Bad Idea · objc.io](https://www.objc.io/blog/2021/08/24/conditional-view-modifiers/)