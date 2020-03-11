# Styles

`SwiftUIKit` contains ways to work with existing concepts in new ways.

For instance, having dedicated styles for shadows, corner radii etc. makes it easier to specify and apply app-specific styles.

In the examples below, you could naturally have separate view modifiers for each style, e.g.  `Color.red.cardShadow()`, but the style approach separates the model from the UI.


## CornerRadiusStyle

`CornerRadiusStyle` struct represents a style with a property that matches the `SwiftUI`s `cornerRadius` modifier.

You can use the style properties together with the standard modifier or use the `cornerRadius(_ style:)` `View` extension:

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


## FontStyle

`FontStyle` represents a custom font with a `name`, `style` and `weight`.

You can apply this style with the `shadow(_ style:)` `View` extension or use its properties directly using the built-in `font(name:,style:,weight:)` extension.

```swift
let style = FontStyle(name: "Arial", style: .title, weight: .bold)
let view1 = Text("Hello!").font(style)
let view2 = Text("Hello!").font(name: "Arial", style: .title, weight: .bold)
```

You can specify your own standard styles by creating static, calculated `FontStyle` extension properties:

```swift
extension FontStyle {
    
    static var uglyTitle: FontStyle { 
        FontStyle(name: "Arial", style: .title, weight: .bold) 
    } 
}

let view1 = Text("Hello!").font(.uglyTitle)
```

You can also use the `FontIdentifier` protocol instead of `name`. This makes it possible to use e.g. `SwiftGen`s `FontConvertible` together with this extension.


## ShadowStyle

`ShadowStyle` represents a style with properties that matches the `SwiftUI`s `shadow` modifier.

You can use the style properties together with the standard modifier or use the `shadow(_ style:)` `View` extension:

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
