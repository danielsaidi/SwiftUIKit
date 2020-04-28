<p align="center">
    <img src ="Resources/Logo.png" width=500 />
</p>

<p align="center">
    <a href="https://github.com/danielsaidi/SwiftUIKit">
        <img src="https://badge.fury.io/gh/danielsaidi%2FSwiftUIKit.svg?style=flat" alt="Version" />
    </a>
    <img src="https://img.shields.io/badge/platform-SwiftUI-red.svg" alt="Swift UI" />
    <img src="https://img.shields.io/badge/Swift-5.1-orange.svg" alt="Swift 5.1" />
    <img src="https://badges.frapsoft.com/os/mit/mit.svg?style=flat&v=102" alt="License" />
    <a href="https://twitter.com/danielsaidi">
        <img src="https://img.shields.io/badge/contact-@danielsaidi-blue.svg?style=flat" alt="Twitter: @danielsaidi" />
    </a>
</p>


## About SwiftUIKit

`SwiftUIKit` adds functionality to `SwiftUI`, both things that most probably will be part of the SwiftUI in the next upcoming versions, as well as custom useful functionality.

You can read more about the different parts of `SwiftUIKit` in separate readmes:

* [Blur][Blur]
* [Extensions][Extensions]
* [Gestures][Gestures]
* [Styles][Styles]
* [Toast][Toast]

As things that exist in this library are added to `SwiftUI`, the corresponding functionality in this library will be deprecated and refer to those new features.


## Demo App

This project contains a demo app that shows all available system blur styles. To run the demo app, just open and run the `SwiftUIKit.xcodeproj` project.


## Installation

### Swift Package Manager

```
https://github.com/danielsaidi/SwiftUIKit.git
```

### CocoaPods

```
pod DSSwiftUIKit
```


## <a name="why"></a>Why a big "Kit"?

Having a big "kit" is a bad idea, since it may become too generic and hard to overview. For instance, if I want a SwiftUI toast, I'm not going to dig around in SwiftUIKit for one, but rather use the best single-purpose toast library.

The GitHub stars confirm this as well. Many years ago, I started putting reusable iOS functionality into a library I call [iExtra](https://github.com/danielsaidi/iExtra). I think it's an amazing library and I use it in most of my apps. To this day, it has 12 stars.

However, each project comes with overhead. If I decided to create a new library for each little thing I make, I'd spend a lot of time setting up each new project. There are funny names to come up with, icons and logos to be made, maintenance etc.

SO instead of honoring every little idea with a new library, I'm going to put most here until they are either too large or too good to be a part of this library. When that happens, they'll break out of their little cage and move into a library of their own.


## Contact me

Feel free to reach out if you have questions or if you want to contribute in any way:

* E-mail: [daniel.saidi@gmail.com][Email]
* Twitter: [@danielsaidi][Twitter]
* Web site: [danielsaidi.com][Website]


## License

SwiftUIKit is available under the MIT license. See [LICENSE][License] file for more info.

[Email]: mailto:daniel.saidi@gmail.com
[Twitter]: http://www.twitter.com/danielsaidi
[Website]: http://www.danielsaidi.com

[GitHub]: https://github.com/danielsaidi/SwiftUIKit
[License]: https://github.com/danielsaidi/SwiftUIKit/blob/master/LICENSE

[Blur]: Readmes/Blur.md
[Extensions]: Readmes/Extensions.md
[Gestures]: Readmes/Gestures.md
[Styles]: Readmes/Styles.md
[Toast]: Readmes/Toast.md
