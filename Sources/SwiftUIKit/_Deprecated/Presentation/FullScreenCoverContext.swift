//
//  FullScreenCoverContext.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-10-28.
//  Copyright © 2020-2025 Daniel Saidi. All rights reserved.
//

import SwiftUI

/// This context can be used to present full screen covers.
@available(*, deprecated, message: "This has been moved to PresentationKit and renamed.")
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
    
    /// Bind a ``FullScreenCoverContext`` to the view.
    @available(*, deprecated, message: "This has been moved to PresentationKit")
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


/// This key can be used to keep track of the current value.
@available(*, deprecated, message: "This has been moved to PresentationKit")
public struct FullScreenCoverContextFocusedValueKey: FocusedValueKey {

    public typealias Value = FullScreenCoverContext
}

@available(*, deprecated, message: "This has been moved to PresentationKit")
public extension FocusedValues {

    var fullScreenCoverContext: FullScreenCoverContextFocusedValueKey.Value? {
        get { self[FullScreenCoverContextFocusedValueKey.self] }
        set { self[FullScreenCoverContextFocusedValueKey.self] = newValue }
    }
}
