# Release notes

SwiftUIKit makes its best effort to honor semver, but breaking changes can occur even in minor bumps.



## 5.8.1

This version enables Swift package flags to catch more errors.

This makes it easier to prepare SwiftUIKit for framework usage.



## 5.8

### 💡 Adjustment

* `StorageValue` has been refactored to store an optional value.

### 🗑️ Deprecations

* `AlertContext` has been moved to https://github.com/danielsaidi/PresentationKit.
* `ErrorAlerter` has been moved to https://github.com/danielsaidi/PresentationKit.
* `FullScreenCoverContext` has been moved to https://github.com/danielsaidi/PresentationKit.
* `Image+ScanCode` has been moved to https://github.com/danielsaidi/ScanCodes.
* `LinkText` has been moved to https://github.com/danielsaidi/TextReplacements.
* `NavigationButton` has been moved to https://github.com/danielsaidi/PresentationKit.
* `NavigationLinkArrow` has been moved to https://github.com/danielsaidi/PresentationKit.
* `NavigationContext` has been moved to https://github.com/danielsaidi/PresentationKit.
* `PresentationContext` has been moved to https://github.com/danielsaidi/PresentationKit.
* `ScanCodeType` has been moved to https://github.com/danielsaidi/ScanCodes.
* `SheetContext` has been moved to https://github.com/danielsaidi/PresentationKit.
* `UrlSharing` has been deprecated.



## 5.7

### 🗑️ Deprecations

* `ColorPickerBar` has been moved to https://github.com/danielsaidi/PickerKit.
* `DocumentCamera` has been moved to https://github.com/danielsaidi/PickerKit.
* `ImagePicker` has been moved to https://github.com/danielsaidi/PickerKit.
* `FilePicker` has been moved to https://github.com/danielsaidi/PickerKit.
* `ForEachMultiPicker` has been moved to https://github.com/danielsaidi/PickerKit.
* `OptionalBinding` has been moved to https://github.com/danielsaidi/PickerKit.
* `PhotoCamera` has been moved to https://github.com/danielsaidi/PickerKit.



## 5.6

### 🗑️ Deprecations

* The `PageView` and all related types have been moved to https://github.com/danielsaidi/PageView.



## 5.5

### 🗑️ Deprecations

* The `FlipView` and all related types have been moved to https://github.com/danielsaidi/FlipKit.



## 5.4

### 🗑️ Deprecations

* The `ButtonType` has been moved to https://github.com/danielsaidi/StandardButtons.



## 5.3

Thanks to [pnewell](https://github.com/pnewell), SwiftUIKit now supports Catalyst.

### ✨ Features

* The `FetchedDataView` has a new view-builder initializer.

### 📦 New Package

* The `TextReplacement` has been deprecated and moved to a new package.
* Check out the `https://github.com/danielsaidi/TextReplacementView` repo.

### 🗑️ Deprecations

* The `CornerRadiusStyle` type has been deprecated.
* The `CustomRoundedRectangle` view has been deprecated.
* The `DateFormatter` init extensions have been deprecated.
* The `DispatchQueue` `asyncAfter` extension has been deprecated.
* The `FontStyle` type is no longer used and has been deprecated.
* The `JsonEncoder/Decoder` date extensions have been deprecated.
* The `View` `any()` extension should NOT be used and has been deprecated.


## 5.2

This version updates the icon, logo and build scripts.

It also adds a workaround for the `FlipView` rendering bug when it's placed in a `List`.



## 5.1.9

### 💡 Adjustment

* `FlipView` now handles multiple flip directions and behaves better on iOS 17+.
* `FlipView` now animates when the `isFlipped` binding is changed from the outside.



## 5.1.8

### 🐛 Bug fixes

* This version adds a missing localization text.



## 5.1.7

### ✨ Features

* `ButtonType` has a new "close" type.
* `ButtonType` has a new "toggleSelected" type.



## 5.1.6

### ✨ Features

* `ButtonType` has a new "save" type.



## 5.1.5

### 💡 Adjustment

* `ListActionRow` now has an optional title.



## 5.1.4

### ✨ Features

* `ButtonType` has a several new types.



## 5.1.3

### ✨ Features

* `ScanCode` has a new `rotation` parameter.



## 5.1.2

### ✨ Features

* `ListAction` has a new `copyImage` action.



## 5.1.1

### ✨ Features

* `StandardButtonType` adds even more standard button shortcuts.



## 5.1

### ✨ Features

* `StandardButtonType` has been promoted to a top-level type.
* `View` has a new `StandardButtonType`-based `.keyboardShortcut` modifier.



## 5.0.3

This patch makes the `ImageCache` initializer public. 



## 5.0.2

This patch adds variadic component support to `LinkText` and makes it possible for each link component to specify its own style. 



## 5.0.1

This patch updates `LinkText` to work with Swift 6, after a post 5.0 Swift concurrency change made it stop compiling.

However, since the complexity of the old `LinkText` implementation couldn't be ported to strict concurrency, the new implementation has breaking changes, and uses plain Markdown for its rendering, which reduces the capability of the component.

As a positive side-effect of this change, `LinkText` can now be used on all platforms. 

### ✨ Features

* `LinkText` can now be used on all platforms.
* `View+Conditionals` has a new `searchable(if:...)` variant.

### 💡 Behavior changes

* `TextFieldClearButton` now performs some actions as `MainActor`.

### 🚨 Breaking Changes

* `LinkText` has been reimplemented in Markdown, and has fewer capabilities than before.



## 5.0

This version makes SwiftUIKit use Swift 6.

Due to the strict concurrency enforcement, this involves some breaking changes.

If some of the changes made are too strict for you, feel free to open a GitHub issue to discuss it.

### 🚨 Breaking Changes

* This version renames the `master` branch to `main`.

* All previously deprecated code has been removed.
* All static style and configurations are now computed properties.
* Some classes apply `@MainActor` to properly handle mutable state.

* `ImageCache.shared` has been removed.
* `ImageService.default` has been removed.
* `KeychainWrapper.shared` has been removed.
* `URLOpener` has been removed, since there now are native alternatives. 
* `View+Geometry` has been removed. 


## 4.4

This version adds a new storage value type and moves the gesture buttons to `https://github.com/danielsaidi/GestureButton`.

### ✨ Features

* `StorageValue` is a new property wrapper for serializing data into `AppStorage`.

### 🗑️ Deprecations

* `GestureButton` and `ScrollGestureButton` has been moved to `https://github.com/danielsaidi/GestureButton`.



## 4.3

This version adds localization support, and makes more types use `LocalizedStringKey` instead of `String`.

This version also adds standard button types, which makes it easier to create standard button types.

### ✨ New features

* `Button+Init` adds a new button initializer.
* `Button+Standard` adds new standard button types.



## 4.2.3

### 💡 Behavior changes

* `Label` now used `LocalizedStringKey` for its title. 



## 4.2.2

### 🐛 Bug fixes

* `View+Label` now correctly applies the provided bundle. 



## 4.2.1

### 💡 Behavior changes

* `View.alert` now injects the context as environment object.
* `View.label` now takes a localized string key instead of a key.
* `View.sheet` now injects the context as environment object.
* `View.fullScreenCover` now injects the context as environment object. 



## 4.2

This version refactors many views to take their styles & configs as environment values, instead of injecting them in the initializer.

### ✨ New features

* `CircularProgressBar` now supports customizing animation.
* `FilePicker` now supports providing a custom picker config.
* `ImagePicker` now supports providing a custom picker config.
* `LinkText` has new link style options, to define font weight.
* `ListButtonGroup` is a new group view for groping many buttons.
* `ListButtonStyle` has a new optional `pressedOpacity` init param.
* `ListCard` now supports specifying a custom pressed scale animation.
* `String+Replace` has a new options-based replace extension shorthand.

### 💡 Behavior changes

* `Color.standardListBackground` has been renamed to `listBackground`.
* `FormInlineActionButtonStyle` has been replaced by `ListButtonGroup`.
* `FormText` has been renamed to `ListActionRow`, and is now style-based.
* `ListActionRow` now supports a `ListAction` instead of a trailing view.

### 🗑️ Deprecations

* `DismissableView` has been deprecated due to native SwiftUI support.
* `FormRowTitle` has been deprecated due to now being used internally.
* `PresentationDetents` has been deprecated due to native SwiftUI support.



## 4.1.5

This version makes the list header not use a section, to avoid disclosure groups.

    

## 4.1.4

This version fixes a bug in the image list header extension.

    

## 4.1.3

This version adds a few additional utilities.

### ✨ New features

* `ListHeader` has a new image-specific modifier.
* `View+Label` makes it easy to convert any view to a label.
* `View+macOS` has a new `openAppSettings()` view extension.

### 💡 Behavior changes

* `ListHeader` now applies a platform-specific bottom padding.



## 4.1.2

This version deprecates `ListBadgeIcon`.

### 🗑️ Deprecations

* `ListBadgeIcon` has moved to `https://github.com/danielsaidi/BadgeIcon`.



## 4.1.1

This version makes the `ListBadgeIcon` available on macOS.

### ✨ New features

* `ListBadgeIcon` is now available on macOS.
* `ListBadgeIcon` has a new `appStore` badge.
* `ListBadgeIcon` iconColor is nil by default and adaptive to the badge color.



## 4.1

This version adjusts the `ListBadgeIcon` to behave better.

### ✨ New features

* `ListBadgeIcon` has new properties and render better on iOS 17.
* `ListBadgeIcon` has new predefined types.



## 4.0.1

This patch fixes the default `FormInlineButtonStyle` background in dark mode.

### ✨ New features

* `Color` has a new `standardRowBackground` function.



## 4.0

This major version bumps the deployment targets to iOS 15, tvOS 15, watchOS 8, and macOS 12. This lets us remove a lot of code for older OS versions.

This version also adds everything from `SwiftKit`, which is discontinued. I don't want to manage or add two libraries, so merging them seems valid.

This version removes protocols where not needed. This means that it will no longer have a protocol and a standard implementation if not needed. 

### ✨ New features

* `Bundle+Information` is a new extension with bundle-specific information.
* `BundleFileFinder` is a new file service that can search for files in a bundle.
* `Collections` is a new namespace with collection-related utilities and extensions.
* `Commands` is a new namespace with `macOS` commands.
* `CsvParser` is a new class that can be used to parse CSV files and strings.
* `Date` is a new namespace with date-related extensions and utilities.
* `DeviceIdentifier` is a new class for generating unique device IDs.
* `iCloudDocumentSync` is a new class that can sync iCloud document changes.
* `Keychain` is a new namespace with keychain-related utilities and services.
* `ListAction` is a new enum with quick list action types.
* `MimeType` is a new type that defines various MIME types.
* `Pasteboard` is a multi-platform pasteboard typealias.
* `String` is a new namespace with string-related utilities and extensions.
* `URL+iCloud` adds new iCloud-specific URLs.
* `ValidationRegex` is a struct that defines various regex-based validation expressions.

### 🐛 Bug fixes

* `View` `disableDynamicType` now applies the provided size category instead of always `.medium`.

### 💥 Breaking Changes

* All previously deprecated code has been removed.

* `ActionToggle` has been removed - just use `onChange(of:)` to observe the toggle state instead.
* `DismissableView` now uses `DismissAction` instead of `PresentationMode`.
* `EdgeInsets` factory functions have been replaced with proper initializers.
* `FilePicker` now requires `UTType` instead of `String`.
* `FolderMonitor` has been renamed to `DirectoryMonitor`.
* `FolderObservable` has been renamed to `DirectoryObservable`.
* `FormActionButton` has been replaced with a `FormActionButtonStyle`.
* `FormTextButton` has been removed since `ListAction` is so easy to use.
* `FormTextEditor` and `FormTextField` has been removed. Use `.formRowTitle(...)` instead.
* `ScanCodeGenerator` has been replaced by `Image` and `ImageRepresentable` init extensions.



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
