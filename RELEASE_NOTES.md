# Release notes


## 4.0

This major version bumps the deployment targets to iOS 15, tvOS 15, watchOS 8, and macOS 12.

This lets us remove a lot of code that is just there to cater to the needs of older OS versions.

### ✨ New features

* `ListAction` is a new enum with quick list action types.

### 🐛 Bug fixes

* `View` `disableDynamicType` now applies the provided size category instead of always `.medium`.

### 💥 Breaking Changes

* All previously deprecated code has been removed.

* `ActionToggle` is removed - just use `onChange(of:)` to observe the toggle state instead.
* `EdgeInsets` static factory functions are replaced with proper initializers.
* `FilePicker` now requires `UTType` instead of `String`.
* `FormActionButton` is replaced with a single `FormActionButtonStyle` and a new `FormLabelButtonStyle`.
* `FormTextButton` has been removed, since the `ListAction` is so easy to use.
* `ScanCodeGenerator` is replaced by `Image` and `ImageRepresentable` init extensions.



## 3.9

This release deprecates a bunch of things in preparation for the 4.0 bump.

SwiftUIKit 4.0 will drop support for iOS 13.

### ✨ New features

* `MultilineSubmitViewModifier` is a new view modifier to make multiline text fields submit when return is pressed.
* `View` has a new `multilineSubmit(...)` extension.
* `View` has a new `onMultilineSubmit(...)` extension.

### 💡 Behavior changes

* `ForEachPicker` no longer applies a `.plain` button style.
* `ForEachMultiPicker` no longer applies a `.plain` button style.
* `SwiftPreviewInspector` now provides a standard implementation.

### 🗑 Deprecations

* `MultilineText` has been deprecated. 
* `DotAnimation` has been renamed to `DotLoadingAnimation`.
* `DotAnimationText` has been renamed to `DotLoadingAnimationText`.
* `SearchBar` has been deprecated.
* `SidebarPresenter` has been deprecated.
* `StandardSwiftPreviewInspector` has been deprecated.
* `Text+Markdown` has been deprecated.
* `UIApplication+Windows` has been deprecated.
* `View` height and width modifiers have been deprecated.
* `View+Keyboard` has been deprecated.



## 3.8.3

### ✨ New features

* `FormTextField` has new multiline capabilities.

### 🗑 Deprecations

* `FormTextEditor` has been soft deprecated.



## 3.8.2

### ✨ New features

* `FormText` has a new action-based initializer.
* `FormTextButton` is a new `FormText` button view.



## 3.8.1

### ✨ New features

* `ImageCache.shared` has been made public.



## 3.8

### ✨ New features

* `ImageCache` is a new convenience util for caching images.
* `ImageRepresentable` has a new ` jpegData(resizedToWidth:withCompressionQuality:)` extension.
* `ListPadding` is a new view that can be used to add vertical padding to lists.



## 3.7

### ✨ New features

* `GridItem+Convenience` is a new extension with `GridItem` builders.
* `ReorderableForEach` is a new view that lets you reorder items in stacks and grids.



## 3.6.2

### ✨ New features

* `SidebarListRowBackgroundModifier` is a new view modifier for sidebar lists.



## 3.6.1

This version removes another deprecation.



## 3.6

### ✨ New features

* `StorageCodable` is a new protocol for persisting `Codable` in `AppStorage` and `SceneStorage`.
* `View+Font` extensions are now available on tvOS and watchOS as well.
* `sidebarListRowBackground` is a new `View` modifier for applying a sidebar list row background.  

### 💡 Behavior changes

* `Persisted` is changed to soft deprecated since the `RawRepresentable` `AppStorage` support requires iOS 15.

### 🗑 Deprecations

* The `Printing` namespace has been deprecated and moved to the new PrintingKit.



## 3.5

### ✨ New features

* `NavigationContext` is a new observable class.
* `Image+Resized` is a new `Image` extension.

### 🗑 Deprecations

* `AlertProvider` has been deprecated.
* `FullScreenCoverProvider` has been deprecated.
* `SheetProvider` has been deprecated.



## 3.4

### ✨ New features

* `Color+Hex` has new static functions.
* `ColorPickerBar` is a new color picker component.
* `EditableView` is a new view protocol.
* `ListBadgeIcon` now supports custom icon colors and icon gradients.
* `ListHeaderIcon` is a new view.
* `ListSectionTitle` has a new `withInsets()` init parameter. 
* `ListShelfSection` has a new style.
* `OptionalBinding` is a new func that makes it possible to pass in optional values as a non-optional binding.
* `View` has new `prefers` extensions.
* `ViewShadowStyle` has a new `.sticker` style.

### 🗑 Deprecations

* `ImageRenderer` was not available to 5.7 compilers and has been removed altogether.
* `ImageRenderer` can still be found and copied from any earlier versions of SwiftUIKit.
* `MultilineTextField` has been deprecated.
* `SystemColor` has been deprecated.



## 3.3

This release adds new support for `Codable` and `AppStorage`.

This release also adds new list functionality and text editor styling.

From this version, the demo application has been removed. Instead of the demo application, you can use the internal previews directly. 

### ✨ New features

* `Array` has new extensions that make it possible to use with `Codable` and `AppStorage`.
* `Dictionary` has new extensions that make it possible to use with `Codable` and `AppStorage`. 
* `ImageRepresentable` has new resizing tools.
* `ListBadgeIcon` is a new view that mimics the color badge icons in System Settings.
* `ListCard` is a new view that can be used to create cards for a list or grid.
* `ListDragHandle` is a new view to mimic the native iOS list drag handle.
* `ListSectionTitle` is a new view that mimics a grouped iOS section title.
* `ListShelfSection` is a new view that can be used to create horizontally scrolling shelves in vertically scrolling lists.
* `ProcessInfo` has a new static preview property.
* `TextEditorStyle` lets you style a `TextEditor` like a `TextField`.
* `Image+Symbol` is a new `Image` initializer that serves as a shorthand for `.init(systemName:)`.
* `Image+ListBadgeIcon` is a new `Image` modifier that can be used to convert an image to a color badged icon.

### 💡 Behavior changes

* `Persisted` has been deprecated due to `AppStorageCodable`.
* `ViewShadowStyle` now allows not specifying a shadow color.
* `ViewShadowStyle.badge` has been redesigned to look more like a sticker.

### 🐛 Bug fixes

* The undimmed presentation detents move some code to after layout to improve behavior.

### 🗑 Deprecations

* `UndimmedPresentationDetent` is renamed to `PresentationDetentReference`.
* The `.presentationDetents(undimmed:largestUndimmed:selection:)` modifier is deprecated and replaced by `.presentationDetents(:largestUndimmed:selection:)`. 



## 3.2

### ✨ New features

* `GestureButton` is a new view that can be used to handle multiple gestures with a single button.
* `GestureButtonDefaults` is a new class that can be used to configure the default values for the new gesture buttons.
* `LinkText` is a new view that lets you combine text and tappable links without Markdown.
* `RepeatGestureTimer` is a new class that can be used to trigger a repeating action.
* `ScrollViewGestureButton` is a variant of `GestureButton` that works within a scroll view.
* `SwipeGestureViewModifier` is a new view modifier that exposes the `View+onSwipeGesture` extension to DocC.
* `UndimmedPresentationDetentsViewModifier` is a new view modifier that exposes the `View+presentationDetents` extension to DocC.

### 💡 Behavior changes

* `ImageRenderer` now renders with correct scale - thanks [alfredcc](https://github.com/alfredcc) for this! 

### 🗑 Deprecations

* The `ScrollViewHeader` has been moved to ScrollKit - https://github.com/danielsaidi/ScrollKit



## 3.1

### ✨ New features

* `FormTextField` is now available in iOS 13 as well.
* `LinearProgressBar` is a new, style-based progress view.
* `ListSelectItem` now supports providing a custom select indicator view.
* `ScrollViewHeader` is a new header view with stretch and parallax support.
* `SwiftPreviewInspector` and `StandardSwiftPreviewInspector` are new types for detecting SwiftUI preview mode.
* `UndimmedPresentationDetent` is a new enum that is used to define undimmed detents with `View+PresentationDetents`.
* `View+PresentationDetents` now supports specifying a `largestUndimmed` presentation detent.

### 💡 Behavior changes

* `FormActionButton` now uses `true` as default value for the `dimmed` modifier.
* `FormActionButtonStyle` now lets you style more parts of the form action button.
* `FormText` no longers forces lowercase to its title.
* `SearchBar` no longer adds a divider below the text field.
* `TextFieldClearButton` now animates in the clear button.

### 🐛 Bug fixes

* `CircularProgressBar` is no longer greedy and only allocates the space it needs.

### 🗑 Deprecations

* The entire `CollectionView` namespace has been deprecated, since it's no longer needed on tvOS. 

### 💥 Breaking Changes

* `CircularProgressBarStyle` has been renamed to `CircularProgressBar.Style`.
* `ErrorAlertConvertible` has a new `errorButtonText` property to avoid the hard-coded "OK".
* `ScanCodeGenerator` has a cleaner function name for generating a scan code. 



## 3.0

This major version removes all previously deprecated logic to make the library tighter and cleaner.

If you need any parts of the library that have now been removed, just grab them from the previous `2.9` versions.

### ✨ New features

* The `disableDynamicType` view extension now accepts a size category.
* The `ListSelectItem` now accepts a customizable checkmark icon.

### 💥 Breaking Changes

* The `Documents` namespace has been removed without being previously deprecated.
* The `.safeAreaInsets` environment value has been removed without being previously deprecated.
* The `Views/DetailPanel` namespace has been removed without being previously deprecated.
* The `UIViewWrapper` view has been removed without being previously deprecated.
