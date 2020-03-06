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

`SwiftUIKit` contains additional functionality to `SwiftUI`, both things that should be in `SwiftUI` (and most probably will be soon) as well as custom things that may never (and most probably never will or should be be) be added to SwiftUI.

You can read more about the different parts of this library:

* [Blur][Blur]
* [Extensions][Extensions]
* [Gestures][Gestures]
* [Shadows][Shadows]
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

Not yet supported.


### Carthage

Not yet supported.


## <a name="why"></a>Why a big "Kit"?

Yep, it's an absolutely horrible idea. Putting a bunch of functionality together in a big library makes it too big for people to find what they're looking for. If they want a toast view for SwiftUI, they're not going to dig in "SwiftUIKit" too see if it has one. No, they're going to find the most toasty library out there with the most amount of stars and use that one.

On top of this, there are actual GitHub stars too tell the story. Many years ago, I started putting reusable iOS functionality into a library I call [iExtra](https://github.com/danielsaidi/iExtra). To this day, it has 10 stars, while the tiny `SwiftUIBlurView` I created a few months ago already has 80. That should also tell me something.

However, each open source project comes with a bunch of overhead. If I wanted to create a new library for each little SwiftUI thing I make, I'd have to spend a night on setup for each new project. There are names to come up with, icons and logos to be made etc. and then there's the actual maintenance.

SO instead of honoring every little idea I have with a new library, I'm just going to put them here until they are either too large or too good to be part of this library. When that happens, they'll break out of their little cage and move into a library of their own.


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
[Shadows]: Readmes/Shadows.md
[Toast]: Readmes/Toast.md
