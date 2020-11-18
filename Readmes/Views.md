# Views

`SwiftUIKit` contains custom views. 

They are not in the demo for now, but will be later. 


## AsyncImage

This `Image` view can be used to load images asynchronously. 

This is a very basic implementation, so you probably want to use a library like Kingfisher for more complex operations.


## CircularProgressBar

This view displays a percentual progress in a circle, where the progress is drawn as an arc along the border.


## CircularProgressView

This view displays a circular spinner. It's just a `ProgressView()` with a `CircularProgressViewStyle()`  style attached to it.


## CollectionView

This view wraps a `UIKit` collection view to get muuuch better performance than a set of lazy stacks and grids, which perform horribly on `tvOS`.

You can apply any kind of layout to the collection view. `SwiftUIKit` has two built-in layouts: `shelves` and `verticalGrid`.


## ConditionalView

This view takes a bool expression and either displays a view for when it's `true` else another view.


## DismissableView

This protocol simplifies dismissing SwiftUI screens programatically. Just implement this protocol and add a `PresentationMode` binding and you can dismiss a view with the `dismiss` function.


## FetchedDataView

This view either displays a loading view when content is being fetched, a content view when content has been fetched and a "no data" view when no content was loaded.


## LazyNavigationLink

This navigation link can be used to improve performance, e.g. when you have many of then. The destination is wrapped in a `LazyView`, which resolves its body upon presentation.


## LazyView

This view can be used to improve performance, since the view body is resolved first when the view is presented.


## MinWidthButton

This button type applies a min width to it's wrapped content. It simplifies working with buttons on platforms that applies a solid background below the button content, e.g. tvOS.


## MultilineTextField

This text field view makes it possible to use multiline text editing in SwiftUI.


## MultiPageView

This view represents a `UIKit` page control and lets you present multiple views in a horizontally pages list. 

You can either create this view by providing it with a view collection or an item list with a `pageBuilder` that builds a page view for each item.


## OptionalView

This view takes an optional model and either displays a view for the model when it's not `nil` else a fallback view.


## SimpleMultiPicker

This view renders a simple list of buttons that can be used to pick multiple options in a list of available options.


## SimpleOptionalPicker

This view renders a simple list of buttons that can be used to pick a single, optional option in a list of available options.


## SimplePickerScreen

This view can be used to present a simple picker with a main title and an OK button.


## SimpleSinglePicker

This view renders a simple list of buttons that can be used to pick a single, non-optional option in a list of available options.


## UIViewWrapper

This view makes it easy to wrap a `UIKit` view to make it possible to use it in SwiftUI.


## VerticalResizingList

This view can list a collection of views in a vertical list and resize them to the widest view.

