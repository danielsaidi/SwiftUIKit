# ``SwiftUIKit``

SwiftUIKit adds extra functionality to the SwiftUI framework, like extensions to native types, new views, pickers, utilites etc.



## Overview

![SwiftUIKit logo](Logo.png)

SwiftUIKit is divided into the sections found in the Topics section below.



## Installation

SwiftUIKit can be installed with the Swift Package Manager:

```
https://github.com/danielsaidi/SwiftUIKit.git
```

or with CocoaPods:

```
pod DSSwiftUIKit
```

If you prefer to not have external dependencies, you can also just copy the source code into your app.



## Supported Platforms

SwiftUIKit supports `iOS 13`, `macOS 11`, `tvOS 13` and `watchOS 6`.



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

- ``ScanCodeGenerator``
- ``ScanCodeType``
- ``StandardScanCodeGenerator``

### Errors

- ``ErrorAlerter``
- ``ErrorAlertConvertible``

### Files

- ``FolderMonitor``
- ``FolderObservable``

### Fonts

- ``FontRepresentable``

### Gestures

- ``GestureButton``
- ``GestureButtonDefaults``
- ``GestureTimer``
- ``RepeatGestureTimer``
- ``ScrollViewGestureButton``
- ``SwipeGestureViewModifier``

### Images

- ``ImageRepresentable``

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
- ``UndimmedPresentationDetent``
- ``UndimmedPresentationDetentsViewModifier``

### Previews

- ``SwiftPreviewInspector``
- ``StandardSwiftPreviewInspector``

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
- ``NavigationButton``
- ``NavigationLinkArrow``
- ``PageIndicator``
- ``PageIndicatorDisplayMode``
- ``PageIndicatorStyle``
- ``PageView``
- ``SearchBar``
- ``ScrollViewHeader``
- ``TextReplacement``

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

- ``ListButtonStyle``
- ``ListSelectItem``
- ``ListSubtitle``

### Views/Progress

- ``CircularProgressBar``
- ``LinearProgressBar``

### Views/Text

- ``LinkText``
- ``MultilineText``
- ``MultilineTextField``
- ``TextFieldClearButton``

### Views/Toggle

- ``ActionToggle``
