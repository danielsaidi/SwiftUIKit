//
//  SheetContext.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-06-06.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import Combine
import SwiftUI

/**
 This context can be used to present any `SwiftUI` view as a
 modal sheet.
 
 To use the context, first create an observed instance, then
 bind it to your view using a regular `alert` modifier, then
 call the context's `present` function to present a sheet:
 
 ```swift
 @ObservedObject var context = SheetContext()
 
 view.sheet(context: context)   // or, for more flexibility:
 view.sheet(isPresented: $context.isActive, content: context.sheet)
 
 context.present(Text("Hello, world!"))
 ```
 
 The context-specific `sheet` modifier is more conveinent if
 you use contexts, but the binding/content-specific one is a
 bit more flexible and can be used in other scenarios.
 
 You can also use the `SheetProvider` protocol to present an
 alert for basically anything, e.g. an enum with cases, that
 each returns a specific alert. View the demo for more info.
 */
public class SheetContext: ObservableObject {
    
    public init() {}
    
    @Published public var isActive = false
    
    public var isActiveBinding: Binding<Bool> {
        .init(get: { self.isActive },
              set: { self.isActive = $0 }
        )
    }
    
    public private(set) var sheetView: AnyView? {
        didSet { isActive = sheetView != nil }
    }
    
    public func present(_ provider: SheetProvider) {
        sheetView = provider.sheet
    }
    
    public func present<Sheet: View>(_ sheet: Sheet) {
        sheetView = sheet.any()
    }
    
    public func sheet() -> AnyView {
        sheetView?.any() ?? EmptyView().any()
    }
}
