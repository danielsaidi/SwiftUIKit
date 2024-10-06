//
//  FullScreenCoverContext.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-10-28.
//  Copyright © 2020-2024 Daniel Saidi. All rights reserved.
//

import SwiftUI

/// This context can be used to present full screen covers.
///
/// To use this class, just create a `@StateObject` instance
/// in your presenting view and bind the context to the view:
///
/// ```swift
/// struct MyView: View {
///
///     @StateObject var context = FullScreenCoverContext()
///
///         var body: some View {
///             Button("Show cover") {
///             context.present(Text("Hello, world!"))
///         }
///         .fullScreenCover(context)
///     }
/// }
/// ```
///
/// This view modifier will also inject the provided context
/// as an environment object into the view hierarchy, to let
/// other views in the same hierarchy reuse the same context.
public class FullScreenCoverContext: PresentationContext<AnyView> {

    @MainActor
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
    ///
    /// This also injects this context as environment object.
    func fullScreenCover(
        _ context: FullScreenCoverContext
    ) -> some View {
        fullScreenCover(
            isPresented: context.isActiveBinding,
            content: context.content ?? EmptyView().any
        )
        .environmentObject(context)
    }
}
#endif
