# ``SwiftUIKit``

SwiftUIKit adds extra functionality to the SwiftUI framework, like extensions to native types, new views, pickers, utilites etc.



## Overview

![SwiftUIKit logo](Logo.png)

SwiftUIKit is divided into the sections found in the Topics section below.

For now, the online documentation only contains types that are supported by macOS.



## Installation

The best way to add SwiftUIKit to your app is to use the Swift Package Manager.

```
https://github.com/danielsaidi/SwiftUIKit.git
```

You can add SwiftUIKit to any target that needs it.



## Supported Platforms

SwiftUIKit supports `iOS 13`, `macOS 11`, `tvOS 13` and `watchOS 6`.



## About this documentation

While the documentation can be built for both iOS and macOS, the online version is currently built for macOS. This means that it's macOS-specific and lacks e.g. iOS-specific parts.

To create an iOS-specific documentation, open the package in Xcode, select an iOS Simulator then generate documentation from the `Product` menu.

Any help in making the documentation multi-platform would be greatly appreciated.



## Topics

### Bridging

- ``ImageResource``

### Cameras

- ``DocumentCamera``
- ``PhotoCamera``

### Colors

- ``SystemColor``

### Data

- ``Persisted``
- ``ScanCodeGenerator``
- ``ScanCodeType``
- ``StandardScanCodeGenerator``

### Documents

- ``DocumentPresenter``
- ``DocumentGroupPresenter``
- ``DocumentGroupOnboardingScreen``
- ``DocumentGroupOnboardingError``
- ``DocumentRenameError``

### Files

- ``FolderMonitor``
- ``FolderObservable``

### Gestures

- ``GestureTimer``

### Navigation

- ``UrlOpener``

### Pickers

- ``FilePicker``
- ``ForEachPicker``
- ``ForEachMultiPicker``
- ``ImagePicker``
- ``ListPicker``
- ``ListMultiPicker``
- ``ListPickerItem``
- ``ListPickerSection``
- ``SystemFontPicker``
- ``SystemFontForEachPicker``
- ``SystemFontListPicker``
- ``SystemFontPickerFont``
- ``SystemFontPickerItem``

### SimplePicker

- ``SimplePicker``
- ``SimpleMultiPicker``
- ``SimpleOptionalPicker``
- ``SimplePickerScreen``
- ``SimplePickerValue``
- ``SimpleSinglePicker``

### Presentation

- ``PresentationContext``
- ``AlertContext``
- ``AlertProvider``
- ``FullScreenCoverContext``
- ``FullScreenCoverProvider``
- ``SheetContext``
- ``SheetProvider``

### Sharing

- ``ShareSheet``
- ``UrlSharing``

### Styles

- ``CornerRadiusStyle``
- ``FontIdentifier``
- ``FontStyle``
- ``ShadowStyle``

### Views

- ``ConditionalView``
- ``CustomRoundedRectangle``
- ``DismissableView``
- ``FetchedDataView``
- ``ForEachEnumerated``
- ``NavigationLinkArrow``
- ``OptionalView``
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
- ``TagTextField``
- ``TextFieldClearButton``

### Views/Web

- ``SafariWebView``
- ``WebView``
