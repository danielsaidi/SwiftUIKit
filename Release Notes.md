# Release notes


## 0.2.0

This release adds new classes and views:

* `CornerRadiusStyle` style can be used to specify corner radii.
* The  `cornerRadius(_ style:)` view modifier can be used to apply corner radius styles.
* `FontStyle` style can be used to specify custom fonts.
* The  `font(_ style: FontStyle)` view modifier can be used to apply custom fonts.
* The  `font(name:, style:, weight:)` view modifier can also be used to apply custom fonts.
* `ShadowStyle` style can be used to specify drop shadow styles.
* The  `shadow(_ style:)` view modifier can be used to apply shadow styles.
* The `blur(...)` view modifier simplifies using the system blur styles that are specified in this library.

This release also adds new extensions:

* The `border(content:,width:,cornerRadius:)` `View` extension can be used to apply borders with a certain content (e.g. Color.red), width and corner radius.


## 0.1.0

This is the very first release of SwiftUIKit. It contains a bunch of features, which are described in the readme.
