//
//  FullScreenCoverContext.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-10-28.
//  Copyright © 2020-2025 Daniel Saidi. All rights reserved.
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
@available(*, deprecated, message: "This has been moved to https://github.com/danielsaidi/PresentationKit")
public class FullScreenCoverContext: PresentationContext<AnyView> {

    @MainActor
    public func present<Cover: View>(
        _ cover: @autoclosure @escaping () -> Cover
    ) {
        presentContent(AnyView(cover()))
    }
}

#if os(iOS) || os(tvOS) || os(watchOS)
import SwiftUI

public extension View {
    
    /// Bind an ``FullScreenCoverContext`` to the view.
    ///
    /// This also injects this context as environment object.
    @available(*, deprecated, message: "This has been moved to https://github.com/danielsaidi/PresentationKit")
    func fullScreenCover(
        _ context: FullScreenCoverContext
    ) -> some View {
        fullScreenCover(
            isPresented: context.isActiveBinding,
            content: context.content ?? { AnyView(EmptyView()) }
        )
        .environmentObject(context)
    }
}
#endif

/**
 This key can be used to keep track of the currently focused
 context within a multi-window app.

 To apply it to a view, just use the `focusedValue` modifier
 with your context instance:

 ```swift
 .focusedValue(\.fullscreenCoverContext, context)
 ```

 To access the focus value, e.g. in a menu command, just use
 the `@FocusedValue` property wrapper:

 ```swift
 @FocusedValue(\.fullscreenCoverContext)
 var fullscreenCoverContext: FullscreenCoverContext?
 ```
 */
@available(*, deprecated, message: "This has been moved to https://github.com/danielsaidi/PresentationKit")
public struct FullScreenCoverContextFocusedValueKey: FocusedValueKey {

    public typealias Value = FullScreenCoverContext
}

@available(*, deprecated, message: "This has been moved to https://github.com/danielsaidi/PresentationKit")
public extension FocusedValues {

    var fullScreenCoverContext: FullScreenCoverContextFocusedValueKey.Value? {
        get { self[FullScreenCoverContextFocusedValueKey.self] }
        set { self[FullScreenCoverContextFocusedValueKey.self] = newValue }
    }
}
