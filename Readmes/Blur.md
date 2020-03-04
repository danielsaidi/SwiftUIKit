# Blur

SwiftUIKit contains additional blur logic, to make it possible to use the full range of `UIKit` blur effects in `SwiftUI`.


## BlurView

`SwiftUI` currently doesn't have as many blur styles as `UIKit`. `SwiftUIKit` solves this with a `BlurView`, which can apply any native `UIBlurEffectStyle`.

You can create a blur view and use it in any way you like, e.g.:

```swift
let view = BlurView(style: .dark)
// Do amazing things with the view
```

...but a blur view wont have any effect by its own, since it only blurs anything it overlaps. Therefore, there is also a `View` extension, that can be used to overlay any `SwiftUI` view with a `BlurView`:

```swift
let view = Image("sunset").blur(style: .dark)
```

Overlaying a view with a system blur effect will give the following result:

<p align="center">
<img src ="../Resources/BlurView.jpg" height=400 />
</p>

This view will probably be deprecated when `SwiftUI` adds more blur styles to its toolbox, maybe even as soon as this summer.
