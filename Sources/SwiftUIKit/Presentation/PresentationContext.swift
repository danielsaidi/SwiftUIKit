//
//  AlertContext.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-06-07.
//  Copyright © 2020-2024 Daniel Saidi. All rights reserved.
//

import Combine
import SwiftUI

/**
 This class is shared by presentation-specific contexts, and
 can be used to present many views with a single context.
 
 To use the context, first create an observed instance, then
 bind it to a view using custom view modifiers, for instance:
 
 ```swift
 struct MyView: View {

    @StateObject
    var sheet = SheetContext()

    var body: some View {
        Button("Show sheet", action: showSheet)
            .sheet(sheet)
    }
 }

 extension MyView {

    func showSheet() {
        sheet.present(Text("Hello, world!"))
    }
 }
 ```

 To setup global state, you can define the context as we did
 above and pass it into the view hierarchy. Any nested views
 in the view hierarchy can then use the context to present a
 sheet, alert, cover, etc.

 Note that presenting new sheets and full screen covers will
 require that you create and apply new contexts, otherwise a
 presentation or a dismissal will use the presenting context.
 */
open class PresentationContext<Content>: ObservableObject {
    
    public init() {}
    
    @Published
    public var isActive = false
    
    @Published
    public internal(set) var content: (() -> Content)? {
        didSet { isActive = content != nil }
    }
    
    public var isActiveBinding: Binding<Bool> {
        .init(get: { self.isActive },
              set: { self.isActive = $0 }
        )
    }
        
    public func dismiss() {
        isActive = false
    }
    
    public func presentContent(_ content: @autoclosure @escaping () -> Content) {
        self.content = content
    }
}
