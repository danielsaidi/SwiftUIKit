//
//  FullScreenCoverContext.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-10-28.
//  Copyright © 2020-2024 Daniel Saidi. All rights reserved.
//

import SwiftUI

/**
 This context can be used to present covers in a dynamic way.
 
 To use this class, just create a `@StateObject` instance in
 your presenting view and bind the context to that view:
 
 ```swift
 struct MyView: View {
 
     @StateObject var context = FullScreenCoverContext()
 
     var body: some View {
         Button("Show cover") {
             context.present(Text("Hello, world!"))
         }
         .fullScreenCover(context)
     }
 }
 ```
 
 You can also setup a global context in the application root,
 and pass it as an environment object, to get a single value.
 */
public class FullScreenCoverContext: PresentationContext<AnyView> {
    
    public func present<Cover: View>(
        _ cover: @autoclosure @escaping () -> Cover
    ) {
        presentContent(cover().any())
    }
}

#if os(iOS) || os(tvOS) || os(watchOS)
import SwiftUI

public extension View {
    
    /// Bind an ``FullScreenCoverContext`` to the view.
    func fullScreenCover(_ context: FullScreenCoverContext) -> some View {
        fullScreenCover(
            isPresented: context.isActiveBinding,
            content: context.content ?? EmptyView().any
        )
    }
}
#endif
