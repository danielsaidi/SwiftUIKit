# Gestures

`SwiftUIKit` contains additional gesture utils, modifiers and views, to make it possible to use e.g. swipe gestures in `SwiftUI`.


## SwipeGesture

`SwiftUIKit` provides you with a way to bind swipe gestures to any `View`, since `SwiftUI` for not doesn't have such a modifier:

```swift
Color.red.onSwipeGesture(
    up: self.handleSwipeUp,
    left: self.handleSwipeLeft,
    right: self.handleSwipeRight,
    down: self.handleSwipeDown)
```

This gesture will most probably be replaced by a native gesure in a future version of SwiftUI.


## FlippableView

`SwiftUIKit` contains a `FlippableView`, which is a composite view with a front and back side. 

You can then flip the view by flicking it in different directions:

```swift
let view = FlippableView(front: Color.red, back: Color.green)
```

The flippable view currently has some flicker problems when flipping the view.
