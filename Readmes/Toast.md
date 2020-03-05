# Toast

`SwiftUIKit` contains logic for presenting a customizable toast message above another view.

The `Toast` view has custom `content` and `background` views, which means that you can present anything in this toast.

When presented, a toast will wrap itself and the provided `presenter` view in a `ZStack` and centers itself over the presenter. It uses a fade in animation, stays for a custom `duration` then fades out again.

Since you must provide a `presenter` view when you create a  toast, the easiest way to add a toast to a view is to use the `toast` view extension function:

```swift
@State private var isToastPresented = false

@State private var toastMessage = "" {
    didSet { isToastPresented = !toastMessage.isEmpty }
}

var body: some View {
    VStack(spacing: 0) {
        Color.red.onTapAction { toastMessage = "Red!" }
        Color.green.onTapAction { toastMessage = "Green!" }
        Color.blue.onTapAction { toastMessage = "Blue!" }
    }
    .toast(
        isPresented: $isToastPresented,
        content: Text(toastMessage),
        background: Color.primary.colorInvert())
}
```

If you only want to use a text and a background color, there's a second `toast` function that takes a text and a background color instead of custom views.
