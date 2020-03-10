# Styles

`SwiftUIKit` contains ways to work with existing concepts in new ways.

For instance, having dedicated styles for shadows, corner radii etc. makes it easier to specify and apply app-specific styles.

In the examples below, you could naturally have separate view modifiers for each style, e.g.  `Color.red.cardShadow()`, but the style approach separates the model from the UI.


## CornerRadiusStyle

`CornerRadiusStyle` struct represents a style with a property that matches the `SwiftUI`s `cornerRadius` modifier.

You can use the style properties together with the standard modifier or use the `View` `cornerRadius(_ style:)` extension:

```swift
let style = CornerRadiusStyle(radius: 17)
let view = Color.red.cornerRadius(style)
```

You can specify your own standard styles by creating static, calculated `CornerRadiusStyle` extension properties:

```swift
extension CornerRadiusStyle {
    
    static var card: CornerRadiusStyle { 
        CornerRadiusStyle(radius: 2) 
    } 
}

let view = Color.red.cornerRadius(.card)
```


## ShadowStyle

`ShadowStyle` represents a style with properties that matches the `SwiftUI`s `shadow` modifier.

You can use the style properties together with the standard modifier or use the `View` `shadow(_ style:)` extension:

```swift
let style = ShadowStyle(color: .red, radius: 17, x: 2, y: 4)
let view = Color.red.shadow(style)
```

You can specify your own standard styles by creating static, calculated `ShadowStyle` extension properties:

```swift
extension ShadowStyle {
    
    static var card: ShadowStyle { 
        ShadowStyle(color: .black, radius: 2, x: 2, y: 2) 
    } 
}

let view = Color.red.shadow(.card)
```
