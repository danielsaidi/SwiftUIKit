# Views

`SwiftUIKit` contains custom views. For now, they are not in the demo.


## AsyncImage

This `Image` view can be used to load images asynchronously. It's a very basic implementation, so you probably want to use a library like Kingfisher for more complex operations.


## CircularProgressBar

This view displays a percentual progress in a circle, where the progress is drawn along the border.


## CircularProgressView

This view displays a circular spinner. It's just a `ProgressView()` with a `CircularProgressViewStyle()`  style attached to it.


## CollectionView

This view wraps a `UIKit` collection view to get muuuch better performance than a set of lazy stacks and grids, which perform horribly on `tvOS`.

You can apply any kind of layout to the collection view. `SwiftUIKit` has two built-in layouts: `shelves` and `verticalGrid`.


## DismissableView

This protocol simplifies dismissing SwiftUI screens programatically. Just implement this protocol and add a `PresentationMode` binding and you can dismiss a view with the `dismiss` function.


## FetchedDataView

This view either displays a loading view when content is being fetched, a content view when content has been fetched and a "no data" view when no content was loaded.


## LazyNavigationLink

Lazy navigation links can be used to improve performance, e.g. when you have many of then. The destination is wrapped in a `LazyView`, which resolves its body upon presentation.


## LazyView

Lazy views can be used to improve performance, since the view body is resolved first when the view is presented. 


## MultilineTextField

This text field view makes it possible to use multiline text editing in SwiftUI.


## MultiPageView

This view represents a `UIKit` page control and lets you present multiple views in a horizontally pages list. You can either create it with page views or model items and a page builder.


## OptionalView

This view takes an optional model and either displays a view for the model when it's not `nil` else an `EmptyView`.


## UIViewWrapper

This view makes it easy to wrap a `UIKit` view to make it possible to use it in SwiftUI.
