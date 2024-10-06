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
 
 This view modifier will also inject the provided context as
 an environment object into the view hierarchy, to let other
 views in the same view hierarchy reuse the same context.
 */
public class SheetContext: PresentationContext<AnyView> {

    @MainActor
    public func present<Sheet: View>(_ sheet: @autoclosure @escaping () -> Sheet) {
        presentContent(sheet().any())
    }
}

public extension View {
    
    /// Bind an ``SheetContext`` to the view.
    ///
    /// This also injects this context as environment object.
    func sheet(_ context: SheetContext) -> some View {
        sheet(
            isPresented: context.isActiveBinding,
            content: context.content ?? EmptyView().any
        )
        .environmentObject(context)
    }
}
