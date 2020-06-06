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
 This context can be used to manage action sheets, so a view
 can present a wide range of sheets with a single modifier.
 
 `SheetPresentable` can be implemented by any types that can
 provide a view to this context. It could for instance be an
 app-wide or view-specific enum...or both. This means that a
 view can display a bunch of sheets in the same way.
 
 To use this context within your view, create an instance of
 it and set its `sheet` property whenever you want to show a
 sheet. You can also use `present(_ sheet: SheetPresentable)`
 which just sets the sheet property.
 
 To bind the sheet to your view, you can just use the `sheet`
 modifier as you would do with any other sheet:
 
 ```swift
 .sheet(isPresented: $sheetContext.isActive, content: sheetContext.view)
 ```
 */
public class SheetContext: ObservableObject {
    
    public init() {}
    
    @Published public var isActive = false
    
    public var sheet: SheetPresentable? {
        didSet { isActive = sheet != nil }
    }
    
    public func view() -> AnyView {
        if let view = sheet?.sheetView { return view.any() }
        return EmptyView().any()
    }
    
    public func present(_ sheet: SheetPresentable) {
        self.sheet = sheet
    }
}
