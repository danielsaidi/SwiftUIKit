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
 that implements ``SheetProvider``.
 
 For instance, you can create an enum where all cases return
 a view and have it implement ``SheetProvider``.
 
 To use this class, create a `@StateObject` instance in your
 presenting view, then bind the context to the view with the
 context-specific modifier.
 
 You can now use the `present` functions to present a sheet:
 
 ```swift
 @StateObject var context = SheetContext()
 
 view.sheet(context)
 
 context.present(Text("Hello, world!"))
 // ...or if an `AppSheet` enum implements `SheetProvider`:
 context.present(AppSheet.settings)
 ```
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
