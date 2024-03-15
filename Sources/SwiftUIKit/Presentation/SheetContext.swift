//
//  SheetContext.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-06-06.
//  Copyright © 2020-2024 Daniel Saidi. All rights reserved.
//

import SwiftUI

/**
 This context can be used to present sheets in a dynamic way.
 
 To use this class, just create a `@StateObject` instance in
 your presenting view and bind the context to that view:
 
 ```swift
 struct MyView: View {
 
     @StateObject var context = SheetContext()
 
     var body: some View {
         Button("Show sheet") {
             context.present(Text("Hello, world!"))
         }
         .sheet(context)
     }
 }
 ```
 
 You can also setup a global context in the application root,
 and pass it as an environment object, to get a single value.
 */
public class SheetContext: PresentationContext<AnyView> {
    
    public func present<Sheet: View>(_ sheet: @autoclosure @escaping () -> Sheet) {
        presentContent(sheet().any())
    }
}

public extension View {
    
    /// Bind an ``SheetContext`` to the view.
    func sheet(_ context: SheetContext) -> some View {
        sheet(
            isPresented: context.isActiveBinding,
            content: context.content ?? EmptyView().any
        )
    }
}
