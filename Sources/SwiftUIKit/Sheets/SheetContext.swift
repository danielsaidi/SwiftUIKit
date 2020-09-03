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
 
 To use the context, first create an observed instance, then
 bind it to a view using the `sheet` modifier, then call any
 context `present` function to present a sheet:
 
 ```swift
 @ObservedObject var context = SheetContext()
 
 view.sheet(context: context)
 
 context.present(Text("Hello, world!"))
 // ...or if an `AppSheet` enum implements `SheetProvider`:
 context.present(AppSheet.settings)
 ```
 
 The context-specific `sheet` modifier is more convenient if
 you use contexts, but the binding/content-specific one is a
 bit more flexible and can be used in other scenarios.
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
