//
//  SheetContext.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-06-06.
//  Copyright © 2020-2023 Daniel Saidi. All rights reserved.
//

import SwiftUI

/**
 This context can be used to present any `SwiftUI` view as a
 modal sheet.
 
 To work with strong types, you can create an enum where all
 cases return a sheet view, then present that view.
 
 To use this class, just create a `@StateObject` instance in
 your presenting view and bind the context to that view:
 
 ```swift
 @StateObject var context = SheetContext()
 
 view.sheet(context)
 
 context.present(Text("Hello, world!"))
 // ...or if an `AppSheet` enum implements `SheetProvider`:
 context.present(AppSheet.settings)
 ```
 
 You can now use the contexts functions to present any sheet.
 */
public class SheetContext: PresentationContext<AnyView> {
    
    public func present<Sheet: View>(_ sheet: @autoclosure @escaping () -> Sheet) {
        presentContent(sheet().any())
    }
}
