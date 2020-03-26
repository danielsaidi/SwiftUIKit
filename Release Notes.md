# Release notes


## 0.4.0

This release adds a new geometry `View` extension.

`bindGeometry(to: ...)` lets you bind any `CGFloat` geometry value for a view. It injects a `GeometryReader` and provides it back to the extension's value resolve block.

You can use it like this:

```swift
@State private var height: CGFloat = 0
UIColor.red.bindGeometry(to: $height) { $0.size.height }
```

Breaking changes:

* The `readSafeAreaInsets` `View` extension is renamed to `bindSafeAreaInset(of:to:)`.


## 0.3.0

This release adds some new toast features:

* `ToastContext` is an observable object can be used to manage a view's toast.
* `ToastStyle` is a new struct that contains all available styles for a toast.

This release makes some small api changes:

* The `SwipeGesture` initializer has been made public.
* `Toast` now uses `ToastStyle`  instead of separate style properties.
* The `Toast` extensions now require you to specify a background.
* The text-based `Toast` extension automatically centers the text.    


## 0.2.1

This release adds a new `FontIdentifier`. 

It can be implemented by any font provider, e.g. `SwiftGen`s `FontConvertible`. 


## 0.2.0

This release adds new style structs:

* `CornerRadiusStyle` style can be used to specify corner radii.
* `FontStyle` style can be used to specify custom fonts.
* `ShadowStyle` style can be used to specify drop shadow styles.

These view modifiers simplifies using these styles:

* `cornerRadius(_ style:)` can be used to apply a `CornerRadiusStyle`.
* `font(_ style: FontStyle)` can be used to apply a `FontStyle`.
* `font(name:, style:, weight:)` can also be used to apply custom fonts.
* `shadow(_ style:)` can be used to apply a `ShadowStyle`.

The release also adds new view extensions:

* `blur(...)` simplifies using the system blur styles that are specified in this library.
* `border(content:,width:,cornerRadius:)` can be used to apply borders with a certain content (e.g. Color.red), width and corner radius.


## 0.1.0

This is the very first release of SwiftUIKit. It contains a bunch of features, which are described in the readme.
