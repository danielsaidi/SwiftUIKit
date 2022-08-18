# ``SwiftUIKit``

SwiftUIKit adds extra functionality to the SwiftUI framework, like extensions to native types, new views, pickers, utilites etc.



## Overview

![SwiftUIKit logo](Logo.png)

SwiftUIKit is divided into the sections found in the Topics section below.



## Supported Platforms

SwiftUIKit supports `iOS 13`, `macOS 11`, `tvOS 13` and `watchOS 6`.



## Installation

The best way to add SwiftUIKit to your app is to use the Swift Package Manager.

```
https://github.com/danielsaidi/SwiftUIKit.git
```

SwiftUIKit also supports CocoaPods:

```
pod DSSwiftUIKit
```

You can also clone the repository and build the library locally.



## About this documentation

The online documentation is currently iOS-specific. To generate documentation for other platforms, open the package in Xcode, select a simulator then run `Product/Build Documentation`.

Note that type extensions are not included in this documentation.



## License

SwiftUIKit is available under the MIT license.



## Topics

### Cameras

- ``DocumentCamera``
- ``PhotoCamera``

### Colors

- ``ColorRepresentable``
- ``SystemColor``

### Data

- ``Persisted``
- ``ScanCodeGenerator``
- ``ScanCodeType``
- ``StandardScanCodeGenerator``

### Documents

- ``DocumentPresenter``
- ``DocumentGroupInspector``
- ``DocumentGroupPresenter``
- ``DocumentGroupSheet``
- ``DocumentGroupSheetError``
- ``DocumentRenameError``

### Errors

- ``ErrorAlerter``
- ``ErrorAlertConvertible``

### Files

- ``FolderMonitor``
- ``FolderObservable``

### Fonts

- ``FontRepresentable``

### Gestures

- ``GestureTimer``

### Images

- ``ImageRepresentable``
- ``ImageRenderer``

### Navigation

- ``UrlOpener``

### Pickers

- ``FilePicker``
- ``ForEachPicker``
- ``ForEachMultiPicker``
- ``ImagePicker``
- ``ImagePickerError``
- ``ListPicker``
- ``ListMultiPicker``
- ``ListPickerItem``
- ``ListPickerSection``
- ``SystemFontPicker``
- ``SystemFontForEachPicker``
- ``SystemFontListPicker``
- ``SystemFontPickerFont``
- ``SystemFontPickerItem``

### Pickers/SimplePicker

- ``SimplePicker``
- ``SimpleMultiPicker``
- ``SimpleOptionalPicker``
- ``SimplePickerScreen``
- ``SimplePickerValue``
- ``SimpleSinglePicker``

### Presentation

- ``PresentationContext``
- ``AlertContext``
- ``AlertContextFocusedValueKey``
- ``AlertProvider``
- ``FullScreenCoverContext``
- ``FullScreenCoverContextFocusedValueKey``
- ``FullScreenCoverProvider``
- ``SheetContext``
- ``SheetContextFocusedValueKey``
- ``SheetProvider``

### Printing

- ``ItemPrinter``
- ``ItemPrintingView``
- ``PrintableItem``
- ``StandardItemPrinter``

### Sharing

- ``ShareSheet``
- ``UrlSharing``

### Styles

- ``CornerRadiusStyle``
- ``FontIdentifier``
- ``FontStyle``
- ``ViewShadowStyle``

### Views

- ``CustomRoundedRectangle``
- ``DismissableView``
- ``DotAnimation``
- ``DotAnimationText``
- ``FetchedDataView``
- ``NavigationLinkArrow``
- ``PageIndicator``
- ``PageIndicatorDisplayMode``
- ``PageIndicatorStyle``
- ``PageView``
- ``SearchBar``
- ``TextReplacement``
- ``UIViewWrapper``

### Views/CollectionView

- ``CollectionView``
- ``CollectionViewLayout``
- ``CollectionViewRow``

<!--### Views/DetailPanel-->
<!---->
<!--- ``DetailPanel``-->
<!--- ``DetailPanelButtonGroup``-->
<!--- ``DetailPanelContainer``-->
<!--- ``DetailPanelContext``-->
<!--- ``DetailPanelForm``-->
<!--- ``DetailPanelHeader``-->
<!--- ``DetailPanelPresenter``-->

### Views/Flip

- ``FlipView``
- ``FlipDirection``

### Views/Form

- ``FormActionButton``
- ``FormActionButtonStyle``
- ``FormText``
- ``FormTextEditor``
- ``FormTextField``

### Views/List

- ``ListItem``
- ``ListButton``
- ``ListDisclosureIndicator``
- ``ListHeader``
- ``ListNavigationButton``
- ``ListNavigationLink``
- ``ListSelectItem``
- ``ListSubtitle``
- ``ListText``
- ``ListTextContent``
- ``ListToggle``

### Views/Progress

- ``CircularProgressBar``
- ``CircularProgressBarStyle``
- ``CircularProgressView``

### Views/Text

- ``MultilineText``
- ``MultilineTextField``
- ``TextFieldClearButton``
