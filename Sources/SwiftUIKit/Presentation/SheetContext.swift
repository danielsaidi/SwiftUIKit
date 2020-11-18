//
//  SheetContext.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-06-06.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI

/**
 This context can be used to present any `SwiftUI` view as a
 modal sheet. You can either present plain views or anything
 that implements the `SheetProvider` protocol (e.g. a custom
 enum where each case returns a specific sheet).
 
 To use this class, create a `@StateObject` instance in your
 presenting view, then bind the context to the view with the
 context-specific modifier. You can now use `present` on the
 context to present sheets:
 
 ```swift
 @StateObject var context = SheetContext()
 
 view.sheet(context: context)
 
 context.present(Text("Hello, world!"))
 // ...or if an `AppSheet` enum implements `SheetProvider`:
 context.present(AppSheet.settings)
 ```
 
 `NOTE` In SwiftUI 1, you must use `@ObservedObject` instead
 of `@StateObject`, but this can cause presentation glitches.
 
 `IMPORTANT` `fullScreenCover` and `sheet` view modifiers do
 not work when they are applied to the same view or the same
 view hierarchy. To use both, make sure to apply them to two
 views that do not overlap.
 ```
 */
public class SheetContext: PresentationContext<AnyView> {
    
    public func present<Sheet: View>(_ sheet: @autoclosure @escaping () -> Sheet) {
        presentContent(sheet().any())
    }
    
    public func present(_ provider: SheetProvider) {
        present(provider.sheet)
    }
}
