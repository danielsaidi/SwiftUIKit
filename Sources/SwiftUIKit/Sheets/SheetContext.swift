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
 
 To use the context, first create an instance in a view that
 should be able to show sheets. Then bind the context to the
 view using the `sheet` modifier. You can now present sheets
 by calling any `present` function on the context:
 
 ```swift
 @ObservedObject var context = SheetContext()
 
 view.sheet(context: context)
 
 context.present(Text("Hello, world!"))
 // ...or if an `AppSheet` enum implements `SheetProvider`:
 context.present(AppSheet.settings)
 ```
 
 The `context`-specific `sheet` modifier is a convenient way
 to present sheets with the `SheetContext`, but you can also
 use the native modifiers if you want or need to.
 
 `IMPORTANT` `@ObservedObject` most often works great, but I
 have had problems with it in apps that target iOS 14, where
 sheets either don't appear or immediately closes. Replacing
 `@ObservedObject` with `@State` has solved the problem, but
 it is not consistent. My advice is to try `@ObservedObject`
 first and only replace it with `@State` if it doesn't work.
 */
public class SheetContext: PresentationContext<AnyView> {
    
    public override func content() -> AnyView {
        contentView ?? EmptyView().any()
    }
    
    public func present<Sheet: View>(_ sheet: Sheet) {
        present(sheet.any())
    }
    
    public func present(_ provider: SheetProvider) {
        contentView = provider.sheet
    }
}
