# Release notes


## 3.5.1

### ✨ New features

* `View+Font` extensions are now available on tvOS and watchOS as well.

### ✨ Behavior changes

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

### ✨ Behavior changes

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



## 2.9.3

This version removes the `MockingKit` dependency.



## 2.9.2

This version makes ocmpiling for macOS work in Xcode 14.

The version also deprecates more things, such as the list items. The list views are deprecated since later SwiftUI versions makes great use of the `Label` view to render things natively. The list views just adds extra complexity with little gains.

One thing that the list views did well, though, was to make the entire list items tappable, where native labels only take up as much space as they need, even in lists. To address this, there is a new button style called `ListButtonStyle`, which you can apply to an entire list to make all buttons behave the same way.  

### ✨ New features

* `ListButtonStyle` makes the button span across the entire width and applies a rectangular content shape.

### 💡 Behavior changes

* List items will render differently, without the padding.

### 🐛 Bug fixes

* This version fixes compile errors on macOS by temporarily only making some types available for iOS. 

### 🗑 Deprecations

* `ListButton` has been deprecated.
* `ListDisclosureIndicator` has been deprecated.
* `ListHeader` has been deprecated.
* `ListItem` has been deprecated.
* `ListNavigationButton` has been renamed to `NavigationButton`.
* `ListNavigationLink` has been deprecated.
* `ListText` has been deprecated.
* `ListTextContent` has been deprecated.
* `ListToggle` has been deprecated.



## 2.9.1

This version adjusts the undimmed presentation detents view extension, that has stopped working in later Xcode 14 betas.

The fix makes sure to always inject a `.large` detents into the provided set. This is hopefully temporary.



## 2.9

This version adds some minor features and deprecates more functionality.

I've also adjusted the indentation of multiline function signature end parenthesis, to avoid auto-indentation issues in later versions of Xcode. 

### ✨ New features

* `ActionToggle` is a toggle that performs actions when it's toggled, instead of toggling the value. 
* `Color+Random` now has a range parameter to let you randomize colors in a certain range. 
* `DotAnimation` is a re-added, previously removed view, that animates a series of dots.
* `DotAnimationText` is a re-added, previously removed view, that renders a text followed by a dot animation.
* `ImagePicker` has new `allSourceTypes` and `availableSourceTypes` properties.
* `View+PersistentSystemOverlays` adds a view extension for only hiding persistent system overlays if the feature is available.
* `View+Searchable` adds a conditional searchable view extension. 

### 💡 Behavior changes

* `ErrorAlerter` has been made public.
* `ListItem` no longer applies a minimum height.

### 🗑 Deprecations

* `CircularProgressView` has been deprecated, since it just applies a `.circular` style to `ProgressView`.
* `ConditionalView` has been deprecated, since conditional views shouldn't be encouraged.
* `ForEachEnumerated` has been deprecated. Use `Collection+EnumeratedArray` instead.
* `OptionalView` has been deprecated, since conditional views shouldn't be encouraged.
* `SimplePicker` types have been deprecated; use the new picker views instead.
* `TagTextField` has been deprecated and moved to https://github.com/danielsaidi/TagKit



## 2.8

This version adds a the possibility to present custom sized, undimmed sheets in SwiftUI. 

This version also adds a backported version of the native SwiftUI 4 `ImageRenderer`. The backported version is only available in iOS 15 and before. In iOS 16 and later, you'll get the native one.

### ✨ New features

* `Font+FontRepresentable` adds new ways to create SwiftUI fonts with platform-agnostic ones.
* `ImageRepresentable+Size` adds resizing to macOS, tvOS and watchOS as well.
* `ImageRenderer` is a new type that replaces the old `View+Snapshot` extension and serves as a bridge between iOs 16 and earlier versions.
* `ImageRenderer+Image` extends the SwiftUI 4 renderer with a platform-agnostic image property.
* `ImageRenderer+Scale` extends the SwiftUI 4 renderer with new scale initializers.
* `View+PresentationDetents` adds new `presentationDetents(undimmed:)` view modifiers.

### 🗑 Deprecations

* `Image+Snapshot` has been replaced by the new `ImageRenderer`.



## 2.7

### ✨ New features

* `Color` has new hex string- and int-based initializers.
* `ColorRepresentable` is a new typealias that bridges NSColor and UIColor.
* `ColorRepresentable` has new hex string- and int-based initializers.
* `ErrorAlerter` is a new protocol that can be implemented by any type that can alert errors using an `AlertContext`.
* `ErrorAlertConvertible` is a new protocol that can be implemented by any error that can describe itself as an error `Alert`.
* `FontRepresentable` is a new typealias that bridges NSFont and UIFont.
* `Persisted` can now be used with SwiftUI and will properly update observing views. 

### 💡 Behavior changes

* `PresentationContext` is now `open` instead of `public`.
* `DocumentCamera` now passes on its actions instead of itself.
* Unit tests no longer use Quick and Nimble. 

### 🗑 Deprecations

* `DocumentGroupOnboardingScreen` has been renamed to `DocumentGroupSheet`.
* `DocumentGroupOnboardingScreenError` has been renamed to `DocumentGroupSheetError`.
* `DocumentGroupOnboardingScreen` `presentAsOnboarding` has been renamed to `presentFromDocumentGroup`.
* `ImageResource` has been renamed to `ImageRepresentable`.
* `ShadowStyle` has been renamed to `ViewShadowStyle` to not conflict with the new SwiftUI 4 ShadowStyle that comes in Xcode 14.



## 2.6

This version adds focus and printing utils, makes the system font picker work better on multiple platforms and deprecates web views.

Web views can be found in the new [WebViewKit](https://github.com/danielsaidi/WebViewKit) from now on. 

### ✨ New features

* `AlertContextFocusedValueKey` is a new type that can be used to bind and access an focused alert.
* `FullScreenModalContextFocusedValueKey` is a new type that can be used to bind and access a focused full.
* `ItemPrinter` is a new protocol that can be implemented by types that can print printable items.
* `ItemPrintingView` is a view protocol that adds item printing functionality to any view. 
* `PrintableItem` defines a list of printable items, currently only pdf documents.
* `SheetContextFocusedValueKey` is a new type that can be used to bind and access a focused sheet.
* `StandardItemPrinter` is an multi-platform `ItemPrinter` implementation that prints using `UIPrintInteractionController`.

### 💡 Behavior changes

* `SystemFontPicker` has been adjusted to work better on various platforms.
* `SystemFontPickerFont` has been adjusted to work better on various platforms.

### 🐛 Bug fixes

* `SystemFontPicker` now uses the provided fonts instead of all.

### 🗑 Deprecations

* `SafariWebView` has been deprecated - use WebViewKit instead.
* `WebView` has been deprecated - use WebViewKit instead.



## 2.5

### ✨ New features

* `PageIndicator` is a new view that mimics the page dots in a page view.
* `PageIndicatorDisplayMode` is a new enum that can be used to control indicator views.
* `PageIndicatorStyle` is a new enum that can be used to style indicator views.
* `PageView` is now available for macOS as well.

### 💡 Behavior changes

* `PageView` is now generic and no longer generates `AnyView` views.

### 💥 Breaking Changes

* `PageView` for iOS is now generic with new initializer signatures.
* `PageView` `indexDisplayMode` is now called `pageIndicatorDisplayMode`.



## 2.4

This release adds a bunch of new views and features as well as new macOS utils.

This release also deprecates a bunch of stuff to make the library more focused.

Note that `WebView` now wraps a `WKWebView` instead of a `SFSafariViewController`. If you want the old behavior, use the new `SafariWebView`.

### ✨ New features

* `DetailPanel` is a new macOS view that mimics a trailing detail panel.
* `DetailPanelButtonGroup` is a new macOS view that can be used to mimic a native, segmented button group. 
* `DetailPanelContainer` is a new macOS view with a main content view and a trailing detail panel.
* `DetailPanelContext` is a new macOS class that can be used with the new `DetailPanelPresenter`.
* `DetailPanelForm` is a new macOS view that can be used to wrap form content within a `SideBar`.
* `DetailPanelHeader` is a new macOS view that can adjust the provided text to look like a native detail panel header. 
* `DetailPanelPresenter` is a new macOS protocol that can be implemented to add detail panel functionality to the implementing type.
* `ForEachPicker` is a new view that works like the `ListPicker`, but doesn't wrap the content in a `List`.
* `ForEachMultiPicker` is a new view that works like the `MultiListPicker`, but doesn't wrap the content in a `List`.
* `Form` has a new `detailPanelForm` modifier.
* `FormActionButtonStyle` now has mutable properties.
* `ListItemSubtitle` is a new view that copies its behavior from the deprecated `MenuListSubtitle`.
* `ListText` has a new icon and subtitle parameter.
* `ListTextContent` is a new view that just renders the content of a `ListText`.
* `SafariWebView` is a new name for the previous version of `WebView`.
* `ScanCodeGenerator` `generateCodeView` is now a protocol implementation.
* `ScanCodeType` now supports `aztek` and `pdf417` as well.
* `ScanCodeType` now implements more protocols to make it more versatile.
* `ScanCodeType` has a new `code128` case that replaces `barcode`.
* `ScanCodeType.name` is now the capitalized version of the raw string value.
* `SidebarPresenter` is a new macOS protocol that can be implemented to add sidebar functionality to the implementing type.
* `SystemFontPicker` is a new view that uses a `Picker`.
* `SystemFontForEachPicker` is a new view that uses a `ForEach` picker instead of a `List`.
* `SystemFontListPicker` now has a `fonts` init parameter.
* `SystemFontListPicker` now has an `itemFontSize` init parameter.
* `SystemFontListPicker` now has a `dismissAfterPick` init parameter.
* `SystemFontPickerFont`s initializer and properties are now public.
* `SystemFontPickerFont` is a new public struct that is used by the various font pickers.
* `SystemFontPickerItem` is a new view that can be used to display a picked system font.
* `Text` has a new `detailPanelHeader` modifier.
* `UrlOpener` now supports macOS as well.

### 💡 Behavior changes

* `ListItem` now only applies a min height on iOS.
* `ListPicker` now uses a `ForEachPicker` for each section.
* `ListMultiPicker` now uses a `ForEachMultiPicker` for each section.
* `ScanCodeType.barcode` is now an alias for `ScanCodeType.code128`. 
* `WebView` now wraps a `WKWebView` instead of a `SFSafariViewController`.

### 🗑 Deprecations

* `AsyncImage` has been deprecated. Use SwiftUI AsyncImage instead.
* `AsyncImageLoader` has been deprecated. Use SwiftUI AsyncImage instead.
* `BlurView` and `View+Blur` is deprecated. Use the native material approach instead.
* `ColorBadge` has been deprecated.
* `FontListPicker` has been renamed to `SystemFontListPicker`.
* `FullHeightView` has been deprecated.
* `FullSizeView` has been deprecated.
* `FullWidthView` has been deprecated.
* `ListPicker` no longer has a `title`.
* `ListMultiPicker` no longer has a `title`.
* `SystemFontListPicker` no longer has a `title`.
* `Presentation/Toast` has been deprecated. Use the new [SystemNotification](https://github.com/danielsaidi/SystemNotification) library instead.
* `View+Alert` `alert(context:)` has been renamed to `alert(_ :)`.
* `View+FullScreenCover` `fullScreenCover(context:)` has been renamed to `fullScreenCover(_ :)`.
* `View+Sheet` `sheet(context:)` has been renamed to `sheet(_ :)`.

### 💥 Breaking Changes

* `Color.clearInteractable` has been deprecated and should not be used anymore.
* `Picker` has been removed, since it caused conflicts with SwiftUI.
* `UrlOpener` default functions are no longer part of the protocol definition.
* `View.clearInteractable` has been deprecated and should not be used anymore. 



## 2.3.3

### ✨ New features

* `DocumentPresenter` has a new `canRenameDocument` function.



## 2.3.2

### 💡 Behavior changes

* `ListNavigationButton` is now available on all platforms.
* `ListDisclosureIndicator` is now available on all platforms.

### 🗑 Deprecations

* `ListNavigationButton` has been renamed to `ListNavigationButton`.



## 2.3.1

This release adjust the `ListToggle`.

### 💡 Behavior changes

* `ListToggle` now applies `.labelsHidden()` to the toggle, to make it take up less space.



## 2.3

This release adds new pickers and document group utils.

### ✨ New features

* `DocumentPresenter` is a new protocol that can be used by types that present a document in a `DocumentGroup`.
* `DocumentGroupOnboardingScreen` is a new view that lets you present an onboarding from a `DocumentGroup`-based app.
* `FontListPicker` is a new list picker for picking fonts.
* `ListPicker` has a new `animatedSelection` configuration.
* `UIApplication` has a new `activeWindows` property.
* `UIApplication` has a new `activeWindowScenes` property.
* `UIApplication` has a new `activeKeyWindows` property.

### 💡 Behavior changes

* `ListItem` no longer applies a plain button style. Make sure to account for this change.

### 💥 Breaking Changes

* `DocumentPresenter` has been renamed to `DocumentGroupPresenter`.



## 2.2

This release adds DocC documentation and bumps the package Swift version to 5.5.

This release also removes some iOSApplicationExtension unavailability, that was enforced by the early Xcode 13 betas.

### ✨ New features

* `DocumentPresenter` is a new protocol that simplifies dismissing in a `DocumentGroup`.

### 🗑 Deprecations

* `SizingVStack` has been deprecated.
* `Picker` has been renamed to `ListPicker`.
* `MultiPicker` has been renamed to `ListMultiPicker`.
* `PickerListItem` has been renamed to `ListPickerItem`.
* `PickerSection` has been renamed to `ListPickerSection`.
* `PickerSection` `pickerHeader` has been renamed to `header`.



## 2.1

This release adds a brand new "list item" concept that replaces the previous "menu list" one.

`NOTE` This release was revised, with some list view names shortened and a few more list view items added. This is the official 2.1, but it is also released as a 2.1.1 to avoid dependency cache problems.

### ✨ New features

* `EdgeInsets` has a new `init(all:)` initializer.
* `EdgeInsets` has a new `init(horizontal:,vertical:)` initializer.
* `Label` has a new `init(String, Image)` initializer.
* `View+Frame` has a new `frame(square:)` view extension.
* `View+DynamicType` has a new `disableDynamicType()` view extension.

* `ListItem` is a new view that can be used to make items in a list get the same style and behavior.

* `ListButton` is a new view that wraps its content in a `ListItem` that is embedded in a `Button`.
* `ListNavigationButton` is a new view that wraps its content in a `ListButton` and appends a trailing `ListDisclosureIndicator`.
* `ListDisclosureIndicator` is a new view that imitates and iOS navigation link arrow.
* `ListNavigationLink` is a new view that wraps its content in a `ListItem` that is embedded in a `NavigationLink`.
* `ListSelectItem` is a new view that wraps its content in a `ListItem` and applies a checkmark if the item is selected.
* `ListText` is a new view that wraps a `Text` view in a `ListItem`.
* `ListToggle` is a new view that wraps its content in a `ListItem` and appends a trailing `Toggle`.

### 🗑 Deprecations

* The `MenuList` namespace is deprecated and replaced with the new `List` namespace.



## 2.0

This version requires Xcode 13 and later, since it refers to the latest api:s.

Parts of the library that have native corresponding parts in newer versions of SwiftUI, like `SearchBar`. They will be around until the library targets the versions of SwiftUI where they were introduced.   

### ✨ New features

* `Color+Codable` is a new extension that makes Color codable.
* `Color+Random` now lets you randomize the color opacity as well.
* `EnvironmentValues+SafeAreaInsets` lets you read the safe are insets of the key window.
* `FormActionButton` can now be provided with a custom style.  
* `FormActionButtonStyle` can now be configured with a custom style.  
* `MenuListIcon` has a new emoji-based initializer.
* `MenuListItem` now lets you use any custom content builder.
* `MenuListItemStack` is a new view that lets you reuse the spacing and tap behavior.
* `MenuListSection` is a new view for menu list sections.
* `MenuListSlider` is a new view for menu list sliders.
* `MenuListSubtitle` is a new view for menu list subtitles.
* `MenuListToggle` is a new view for menu list toggles.
* `MultilineText` is a new text view that can be used when a multiline text is cut off with ...
* `MultiPicker` is a new, generic multi item picker. It will probably replace `SimpleMultiPicker` in due time.
* `Persisted` now lets you inject a custom store.
* `Picker` is a new, generic single item picker. It will probably replace `SimplePicker` in due time.
* `PickerListItem` is a new protocol that can be used in `Picker` lists. 
* `PickerSection` is a new, generic struct that can be used to divide a `Picker` and `MultiPicker` into sections.
* `ShadowStyle` has a new `formActionButton` type.
* `ShadowStyle` has zero defaults for `x` and `y`.
* `SystemColor` has a bunch of new colors.
* `SystemColor` is now `Codable` and `Equatable`.
* `Text+Markdown` is a new view extension that provides a new `Text(markdown:)` initializer.
* `UrlSharing` is a new protocol that any view can implement to easily be able to share urls.
* `View+Autosave` is a new view extension that provides a customizable autosave view modifier.


### 💡 Behavior changes

* `FormActionButtonStyle` no longer applies a primary text color.
* `FormActionButtonStyle` no longer applies a shadow by default. You can define one with the static `shadowStyle` property.


### 💥 Breaking Changes

* All deprecated parts of the library have been removed.
* `CGFloat` `standardKeyboardRowHeight` now only supports idiom and orientation.
* `MenuListItemIcon` has been renamed to `MenuListIcon`.
* `SystemColor` no longer auto-implements `SimplePickerValue`.
* `UserDefaultsPersisted` has been renamed to `Persisted`.
 


## 1.7.2

### ✨ New features

* `FlipView` has a new `isFlipped` binding, so that it can be read from outside as well.
* `FormText` now supports iOS 13.
* `FormText` has a new `trailingView` property. 
* There is a new `UIImage+Rotated` extension.

### 💥 Breaking Changes

* `ScanCodeGenerator` functions `of` parameter name is not omitted. 



## 1.7.1

### 💡 Behavior changes

This release renames `ActionButton` and `ActionButtonStyle`  to `FormActionButton` and `FormActionButtonStyle`, since the name "action button" is too general.

### 🐛 Bug fixes

* This release fixes build errors on tvOS and macOS.

### 🗑 Deprecations

* `ActionButton` and `ActionButtonStyle` has been deprecated.



## 1.7.0

### ✨ New features

* `FormText` is a new view to present text in `List` forms.
* `FormTextEditor` is a new view to present text editors in `List` forms.
* `FormTextField` is a new view to present text fields in `List` forms.
* `ActionButton` is a new button that resembles the action button in e.g. Contacts.
* `ActionButtonStyle` is a new button style that can be used for action buttons.
* `ScanCodeGenerator` is a new protocol for types that can generate scan codes.
* `StandardScanCodeGenerator` is a new, standard implementation of `ScanCodeGenerator`.

### 🗑 Deprecations

* `QrCodeGenerator` has been deprecated due to the new `QrCodeGenerator`.
* `StandardQrCodeGenerator` has been deprecated due to the new `StandardQrCodeGenerator`.



## 1.6.0

### ✨ New features

* `FlipView` has a new `flipDuration` property.
* `FlipView` is now supported by all platforms.
* `ImageResource` is now supported by `watchOS` and `tvOS` as well.
* `MenuListItemIcon` is a new view for menu list items. 

### 🐛 Bug fixes

* `FlipView`  handles flipping and view transitions better than before.
* `ImagePicker` now completes with failure if original image is missing.

### 🗑 Deprecations

* `FlippableView` has been renamed to `FlipView`. 

### 💥 Breaking Changes

* `ImagePicker`'s result now uses a raw `UIImage` instead of an `Image`. 



## 1.5.1

This version makes the library build under Xcode beta 4, by marking some features as unavailable for iOS application extensions.

This affects the following files:

* View+Keyboard
* SearchBar
* UrlOpener

These parts of the library will no longer be available in app extensions.



## 1.5.0

This version adds image utils that help writing multiplatform apps.

### ✨ New features

* `ImageResource` is a new typealias for e.g. `NSImage` and `UIImage`.
* `Image` has a new `imageResource`-based initializer.
* `NSImage` has some new extensions, like `cgImage` and `jpegData`.



## 1.4.1

### ✨ New features

* `ColorBadge` is a new view that renders any color as a circular badge.



## 1.4.0

### ✨ New features

* `FolderMonitor` can be used to monitor changes to a folder on the file system.
* `FolderObservable` can be used to observe changes to a folder on the file system.
* `ProcessInfo` has a new `isSwiftUIPreview` extension that can be used to tell if code is running within a preview or not.
* `SystemColor` is a new enum that makes it easy to use and pick built-in system `Color` values.
* `TagTextField` is a text field that automatically slugifies text as you type.



## 1.3.1

This version adds a plain button style to regular `MenuLinkItem` buttons.



## 1.3.0

This version cleans up the `MenuList` types a bit:

* `MenuListItem` now requires named parameters. 
* `MenuListButton` and `MenuListLink` are removed. 
* Instead, you can use the new `button`, `navigationButton` and `navigationLink` modifiers.
* `Image+menuListNavigationArrow` has been converted to a new `NavigationLinkArrow` view.



## 1.2.5

This release tweaks the behavior of `FlippableView` to support flipping in all directions.

It also adds a new `TabViewItem` as well as an `Image+TabViewItem` extension.



## 1.2.4

This release fixes compiler errors for menu list on other platforms than iOS.



## 1.2.3

This release adds new `View` extensions: `.interactable()`, `.height(_)` and `.width(_)`.



## 1.2.2

This release adds two new `badge` and `elevated` `ShadowStyle`s.



## 1.2.1

This release makes the `MenuList` title optional.



## 1.2.0

### New features

* `Extensions/UIKit` has a bunch of new `UIImage` extensions.
* `ForEachEnumerated` is a new view that lets you iterate over non-identifiable collections.
* `Lists` is a new folder with views that simplifies building menu lists.
* `View+SwipeGesture` is rewritten to work on all platforms.

### Deprecated

* `SwipeGesture` is no longer needed and has been deprecated.



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
