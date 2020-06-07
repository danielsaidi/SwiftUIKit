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
 This context can be used to present any `View` and anything
 that implements`SheetPresentable` as modal sheets.
 
 `SheetPresentable` can be implemented by any enum, class or
 struct that can provide a `sheet` to this context. It means
 that you can implement custom sheets in many different ways
 and present all of them the same way, using this context.
 
 To use this context within your view, create an instance of
 it then call any of the `present(_ sheet: SheetPresentable)`
 or `present<Sheet: View>(_ sheet: Sheet)` to present sheets.
 To bind the sheet to views, use the `sheet` modifier as you
 normally do:
 
 ```swift
 .sheet(isPresented: $sheetContext.isActive, content: sheetContext.sheet)
 ```
 */
public class SheetContext: ObservableObject {
    
    public init() {}
    
    @Published public var isActive = false
    
    public private(set) var sheetView: AnyView? {
        didSet { isActive = sheetView != nil }
    }
    
    public func present(_ sheet: SheetPresentable) {
        sheetView = sheet.sheet
    }
    
    public func present<Sheet: View>(_ sheet: Sheet) {
        sheetView = sheet.any()
    }
    
    public func sheet() -> AnyView {
        sheetView?.any() ?? EmptyView().any()
    }
}
