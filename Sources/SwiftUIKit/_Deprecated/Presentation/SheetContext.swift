//
//  SheetContext.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-06-06.
//  Copyright © 2020-2025 Daniel Saidi. All rights reserved.
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
@available(*, deprecated, message: "This has been moved to https://github.com/danielsaidi/PresentationKit")
public class SheetContext: PresentationContext<AnyView> {

    @MainActor
    public func present<Sheet: View>(_ sheet: @autoclosure @escaping () -> Sheet) {
        presentContent(AnyView(sheet()))
    }
}

@available(*, deprecated, message: "This has been moved to https://github.com/danielsaidi/PresentationKit")
public extension View {
    
    /// Bind an ``SheetContext`` to the view.
    ///
    /// This also injects this context as environment object.
    func sheet(_ context: SheetContext) -> some View {
        sheet(
            isPresented: context.isActiveBinding,
            content: context.content ?? { AnyView(EmptyView()) }
        )
        .environmentObject(context)
    }
}

/**
 This key can be used to keep track of the currently focused
 context within a multi-window app.

 To apply it to a view, just use the `focusedValue` modifier
 with your context instance:

 ```swift
 .focusedValue(\.sheetContext, context)
 ```

 To access the focus value, e.g. in a menu command, just use
 the `@FocusedValue` property wrapper:

 ```swift
 @FocusedValue(\.sheetContext)
 private var sheetContext: SheetContext?
 ```
 */
@available(*, deprecated, message: "This has been moved to https://github.com/danielsaidi/PresentationKit")
public struct SheetContextFocusedValueKey: FocusedValueKey {

    public typealias Value = SheetContext
}

@available(*, deprecated, message: "This has been moved to https://github.com/danielsaidi/PresentationKit")
public extension FocusedValues {

    var sheetContext: SheetContextFocusedValueKey.Value? {
        get { self[SheetContextFocusedValueKey.self] }
        set { self[SheetContextFocusedValueKey.self] = newValue }
    }
}
