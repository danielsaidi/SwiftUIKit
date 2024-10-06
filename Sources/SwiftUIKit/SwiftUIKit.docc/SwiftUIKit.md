# ``SwiftUIKit``

SwiftUIKit adds extra functionality to `SwiftUI`.



## Overview

![SwiftUIKit logo](Logo.png)

SwiftUIKit is a Swift SDK that adds extra functionality to `SwiftUI` and `Swift`. It contains additional components, a lot of extensions to native types, and much more. 

The library is divided into the namespaces found in the Topics section below. For more information, source code, issues, to sponsor the project etc., visit the [project repository][Repository].



## Installation

SwiftUIKit can be installed with the Swift Package Manager:

```
https://github.com/danielsaidi/SwiftUIKit.git
```

If you prefer to not have external dependencies, you can also just copy the source code into your app.



## Getting Started

SwiftUIKit started small, but has grown big over the years. Due to its complexity, I decided to remove the demo. Instead, have a look at the various namespaces and use the live previews to explore the SDK.

I will extract parts of this SDK into separate libraries, to be able to provide better documentation & help. Have a look at [my open-source listing page][OpenSource] for some of these.



## Repository

For more information, source code, etc., visit the [project repository][Repository].



## License

SwiftUIKit is available under the MIT license. See the [LICENSE][License] file for more info.



## Topics

### Cameras

- ``DocumentCamera``
- ``PhotoCamera``

### Colors

- ``ColorRepresentable``

### Data

- ``CsvParser``
- ``MimeType``
- ``ScanCodeType``
- ``StorageValue``
- ``AppStorageValue``
- ``SceneStorageValue``

### Device

- ``DeviceIdentifier``

### Errors

- ``ErrorAlerter``
- ``ErrorAlertConvertible``

### Files

- ``BundleFileFinder``
- ``DirectoryFileManager``
- ``DirectoryMonitor``
- ``DirectoryObservable``
- ``iCloudDocumentSync``

### Flip

- ``FlipView``
- ``FlipDirection``

### Fonts

- ``FontRepresentable``

### Gestures

- ``GestureTimer``
- ``SwipeGestureViewModifier``

### Images

- ``ImageCache``
- ``ImageRepresentable``

### Keychain

- ``KeychainItemAccessibility``
- ``KeychainService``
- ``KeychainWrapper``

### Loading

- ``DotLoadingAnimation``
- ``DotLoadingAnimationText``

### Lists

- ``ListAction``
- ``ListActionRow``
- ``ListButtonGroup``
- ``ListButtonGroupStyle``
- ``ListButtonStyle``
- ``ListCard``
- ``ListCardButtonStyle``
- ``ListCardStyle``
- ``ListDragHandle``
- ``ListHeader``
- ``ListPadding``
- ``ListSectionTitle``
- ``ListSelectItem``
- ``ListShelfSection``
- ``ListShelfSectionStyle``
- ``ListSubtitle``
- ``Reorderable``
- ``ReorderableForEach``
- ``SidebarListRowBackgroundModifier``

### Navigation

- ``NavigationButton``
- ``NavigationContext``
- ``NavigationLinkArrow``

### Pages

- ``PageIndicator``
- ``PageIndicatorDisplayMode``
- ``PageIndicatorStyle``
- ``PageView``

### Pasteboard

- ``Pasteboard``

### Pickers

- ``ColorPickerBar``
- ``FilePicker``
- ``ForEachPicker``
- ``ForEachMultiPicker``
- ``ImagePicker``
- ``ListPicker``
- ``ListMultiPicker``
- ``ListPickerItem``
- ``ListPickerSection``
- ``OptionalBinding(_:_:)``
- ``SystemFontPicker``
- ``SystemFontForEachPicker``
- ``SystemFontListPicker``
- ``SystemFontPickerFont``
- ``SystemFontPickerItem``

### Presentation

- ``PresentationContext``
- ``AlertContext``
- ``AlertContextFocusedValueKey``
- ``FullScreenCoverContext``
- ``FullScreenCoverContextFocusedValueKey``
- ``SheetContext``
- ``SheetContextFocusedValueKey``

### Previews

- ``SwiftPreviewInspector``

### Progress

- ``CircularProgressBar``
- ``LinearProgressBar``

### Regex

- ``ValidationRegex``

### Sharing

- ``ShareSheet``
- ``UrlSharing``

### Styles

- ``CornerRadiusStyle``
- ``FontStyle``
- ``ViewShadowStyle``

### Text

- ``LinkText``
- ``MultilineSubmitViewModifier``
- ``TextEditorStyle``
- ``TextFieldClearButton``

### Views

- ``CustomRoundedRectangle``
- ``EditableView``
- ``FetchedDataView``
- ``TextReplacement``



[License]: https://github.com/danielsaidi/SwiftUIKit/blob/master/LICENSE
[Repository]: https://github.com/danielsaidi/SwiftUIKit
[OpenSource]: https://danielsaidi.com/opensource
