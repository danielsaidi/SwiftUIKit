//
//  SheetContext.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-06-06.
//  Copyright © 2020-2025 Daniel Saidi. All rights reserved.
//

import SwiftUI

/// This context can be used to present sheets.
@available(*, deprecated, message: "This has been moved to PresentationKit and renamed.")
public class SheetContext: PresentationContext<AnyView> {

    @MainActor
    public func present<Sheet: View>(_ sheet: @autoclosure @escaping () -> Sheet) {
        presentContent(AnyView(sheet()))
    }
}

@available(*, deprecated, message: "This has been moved to PresentationKit")
public extension View {
    
    /// Bind a ``SheetContext`` to the view.
    func sheet(_ context: SheetContext) -> some View {
        sheet(
            isPresented: context.isActiveBinding,
            content: context.content ?? { AnyView(EmptyView()) }
        )
        .environmentObject(context)
    }
}


/// This key can be used to keep track of the current value.
@available(*, deprecated, message: "This has been moved to PresentationKit")
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
