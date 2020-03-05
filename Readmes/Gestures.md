# Gestures

`SwiftUIKit` contains additional gesture logic, to make it possible to use e.g. swipe gestures in `SwiftUI`.


## SwipeGesture

`SwiftUI` currently doesn't have a swipe gesture action. `SwiftUIKit` provides you with a way to bind swipe gestures to any `View`:

```swift
Color.red.onSwipeGesture(
    up: self.handleSwipeUp,
    left: self.handleSwipeLeft,
    right: self.handleSwipeRight,
    down: self.handleSwipeDown)
```

This gesture will most probably be replaced by a native gesure very soon.


## FlippableView

`SwiftUIKit` provides you with a `FlippableView`, which has a front and back side. You can then flip the view by flicking it in different directions:

```swift
let view = FlippableView(front: Color.red, back: Color.green)
```

The flippable view currently has some flickering problems when flipping the view.
