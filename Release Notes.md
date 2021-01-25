# Release notes


## 1.1.2

`TextReplacement` now supports multiline texts.


## 1.1.1

### New views:

* `CustomRoundedRectangle` is a multi platform shape that lets you specify a custom corner radius for each corner.
* `TextReplacement` can create a composite text view, where a certain substring gets a different text view.   

### New extensions:

* `View+frame` has a new `CGSize`-based frame modifier.


## 1.1.0

### New views:

* `SearchBar` is an iOS specific view that replicates a search bar.
* `WebView` is an iOS-specific view that wraps an `SFSafariViewController` with a custom url.

### Bug fixes:

* `FlippableView` - I have added a missing public initializer.

### Breaking changes:

* `FlipDirection` has been moved into `FlippableView`.


## 1.0.0

### Improvements:

* The demo app now compiles for macOS and runs on M1 machines.
* More views are available for tvOS and watchOS.
* The `SimplePicker` views have been rewritten to great extent and can now be customized across platforms.
* The `SimplePickerScreen` preview shows how the picker can transform for various platforms.
* There is a new `SimplePickerTvScreen` that sets up a simple picker for being used on tvOS. 

### New views:

* `FullHeightView` takes up all available horizontal space and puts its content in the center.
* `FullWidthView` takes up all available vertical space and puts its content in the center.
* `FullSizeView` takes up all available space and puts its content in the center.
* `TextFieldClearButton` is a modifier that adds a trailing clear button within a text view.

### New extensions:

* `Color+ClearInteractable` lets you apply a clear but interactable backround color to make the entire area of a button interactable.
* `TextField+ClearButton` applies a `TextFieldClearButton` to the textfield.
* `View+Keyboard` lets any view dismiss the keyboard.

### Breaking changes:

* The `SimplePicker` changes are breaking.



## 0.9.9

This is the RC for the first major `1.0` release.

This release wraps more logic within `os` checks to make the code build on `macOS`, `tvOS` and `watchOS`.

WIth this release, the demo app has been rebuilt as a universal app that lets you explore SwiftUIKit through interactive demos. As a result, I have removed the separate readmes to avoid having to keep multiple copies of the documentation alive.

The release also adds new views and utils:

* `AsyncImage` is a view that loads an async image from the network.
* `AsyncImageLoader` is an observable class that loads an async image from the network.
* `Camera` wraps an `ImagePicker` that is configured for `.camera` source type.
* `CircularProgressBar` renders a percentual progress in a circle.
* `CircularProgressView` renders a round spinner.
* `ConditionalView` returns the provided content view if the provided expression is `true`, else a fallback view (`EmptyView` by default).
* `FetchedDataView` shows a spinner, fetched data or a failure view.
* `FullScreenCoverContext/Provider` lets you handle full screen covers like sheets, alerts etc.
* `MinWidthButton` applies a min width to it's wrapped content.
* `OptionalView` returns the provided content view if the provided value is not nil, else a fallback view (`EmptyView` by default).
* `SimpleMultiPicker` renders a simple list of buttons that can be used to pick multiple options in a list of available options.
* `SimpleOptionalPicker` renders a simple list of buttons that can be used to pick multiple options in a list of available options.
* `SimplePickerScreen` can be used to present a simple picker with a main title and an OK button.
* `SimpleSinglePicker` renders a simple list of buttons that can be used to pick a single option in a list of available options.
* `WidthVStack` lists views in a vertical stack and provides them with with the largest view width.

The release also adds a highly performant `CollectionView`, based on the amazing work of  [@defagos](https://twitter.com/defagos), which can be found [here](https://github.com/defagos/SwiftUICollection):

The collection view can be configured with various layouts, like `.shelves` and `.grid`.

The release also makes some changes in the various `presentation` contexts:

* Passing around views could mess up `@Binding` properties and cause the views to not update.
* The code has been refactored to use closures instead, which solves this problem.
* My eternal gratitude to [@hybridcattt](https://twitter.com/hybridcattt) for realizing that this was what caused problems.  

Finally, this release also has some breaking changes:

*  `DocumentCamera`, `FilePicker` and `ImagePicker` have been written to behave more like eachother.
*  `FlippableView` is improved with new features and better result, but breaks previous api:s.
*  `LazyView` and `LazyNavigationView` are removed, since I realized that SwiftUI handles this now.
* `MultiPageView` has been renamed to `PageView`.



## 0.9.8

This release contains a new `LazyView` and `LazyNavigationView`, which can be used to improve performance, since they resolve views upon presentation. 



## 0.9.7

This release contains a new `MultiPageView`, which can be used to present multiple views in a horizontal page control. 



## 0.9.6

After comments, the `View+Screenshot` `takeScreenshot` function has been renamed to `snapshot`. The `origin` parameter has `.zero` as default value.

The `View+Keyboard` keyboard avoiding logic has been removed, since SwiftUI now supports it natively.



## 0.9.4 - 0.9.5

These versions add a `UrlOpener`, as well as new extensions:

* `EdgeInsets+Edge` simplifies getting the inset for a certain edge.
* `View+Screenshot` can be used to snapshot any SwiftUI view.
* `View+Visible` has conditional extensions to hide or show a view.



## 0.9.3

This version adds a `DocumentCamera` view, which can be used to scan documents with the device camera.



## 0.9.2

This version adds a `dismiss` function to `PresentationContext`.

This means that these contexts get access to this function:

* `AlertContext`
* `SheetContext`
* `ToastContext`



## 0.9.1

This version adds improved support for watchOS, tvOS and macOS.

The bump version process has been improved to also add linting and a unit test confirmation.



## 0.9.0

There are now more convenient `alert`, `sheet` and `toast` view modifiers, that take a context instead of a binding and a content.

This version contains more breaking changes for the toast components.

* `ToastContext` works just like `SheetContext` and `AlertContext`.
* `ToastContext`, `SheetContext` and `AlertContext` share a base class.
* There is a new `ToastProvider` that can be used with `ToastContext`.
* The `toast` modifier handles presenting and dismissing the toast.
* The `Toast` view has been removed, since it's no longer needed.

You can now use any views with the toast context and modifier, so it should make the toast easier to understand and to use.



## 0.8.2

This release renames the alert and sheet `Presentable` protocols to `Provider`. The old presentables are still around, but marked as deprecated.



## 0.8.1

This release fixes invalid iOS platform version build problems and adds a `Color+Random` extension.



## 0.8.0

This release:

* adds support for macOS, and disables a bunch of features that require UIKit.
* adjusts the `Toast` so that it fits better with the alert and sheet contexts.
* adds a new `UIViewWrapper` that simplifies wrapping `UIKit` views.



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
