# Views

`SwiftUIKit` contains custom views. For now, they are not in the demo.


## DismissableView

This protocol simplifies dismissing SwiftUI screens programatically. Just implement this protocol and add a `PresentationMode` binding and you can dismiss a view with the `dismiss` function.


## LazyNavigationLink

Lazy navigation links can be used to improve performance, e.g. when you have many of then. The destination is wrapped in a `LazyView`, which resolves its body upon presentation.


## LazyView

Lazy views can be used to improve performance, since the view body is resolved first when the view is presented. 


## MultilineTextField

This text field view makes it possible to use multiline text editing in SwiftUI.


## MultiPageView

This view represents a `UIKit` page control and lets you present multiple views in a horizontally pages list. You can either create it with page views or model items and a page builder.


## UIViewWrapper

This view makes it easy to wrap a `UIKit` view to make it possible to use it in SwiftUI.
