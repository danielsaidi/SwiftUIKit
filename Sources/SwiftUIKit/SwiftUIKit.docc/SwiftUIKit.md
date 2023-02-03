# ``SwiftUIKit``

SwiftUIKit adds extra functionality to the SwiftUI framework, like extensions to native types, new views, pickers, utilites etc.



## Overview

![SwiftUIKit logo](Logo.png)

SwiftUIKit is divided into the sections found in the Topics section below.



## Supported Platforms

SwiftUIKit supports `iOS 13`, `macOS 11`, `tvOS 13` and `watchOS 6`.



## Installation

SwiftUIKit can be installed with the Swift Package Manager:

```
https://github.com/danielsaidi/SwiftUIKit.git
```

or with CocoaPods:

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

### Scrolling

- ``ScrollViewWithOffset``

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
