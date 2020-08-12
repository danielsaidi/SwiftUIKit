# Release notes


## 0.8.0

This release adjusts the `Toast` so that it fits better with the alert and sheet contexts.

The release also adds:
* A new `UIViewWrapper` that simplifies wrapping `UIKit` views.


## 0.7.0

This release adds:

* A `DismissableView` view protocol that simplifies dismissing views programatically.
* A `KeyboardAvoiding` modifier and view extension.
* A `MultilineTextView`  that wraps a `UITextView`.


## 0.6.0

This release adds:

* An `AlertContext` that simplifies working with alerts.
* A `SheetContext`  that simplifies working with modal sheets.
* A `QrCodeGenerator` and a `StandardQrCodeGenerator` implementation.


## 0.5.0

This release adds:

* An `ImagePicker`  that can be used to present a `UIImagePickerController`.
* An `FilePicker` that can be used to present a `UIDocumentPickerViewController`.
* An `ShareSheet` that can be used to present a `UIActivityViewController`.
* An `UserDefaultsPersisted` property wrapper that lets you persist data to `UserDefaults`.


## 0.4.2

This release changes the `View` geometry extensions and replaces `bindGeometry(to: ...)` with:

* `bindSafeAreaInsets(to: ...)`
* `bindSize(to: ...)`

You can use them like this:

```swift
@State private var size: CGSize = .zero
@State private var size: CGSize = .zero
UIColor.red.bindGeometry(to: $height) { $0.size.height }
```

## 0.4.1

This release makes the podspec is updated to require Swift 5.2.


## 0.4.0

This release adds a new geometry `View` extension:

* `bindGeometry(to: ...)` lets you bind any `CGFloat` geometry value for a view.

The extension injects a `GeometryReader` and provides values to the provided binding.


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
