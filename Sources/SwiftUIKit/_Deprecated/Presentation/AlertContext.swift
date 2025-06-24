//
//  AlertContext.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-06-07.
//  Copyright © 2020-2025 Daniel Saidi. All rights reserved.
//

import SwiftUI

/// This context can be used to present alerts.
@available(*, deprecated, message: "This has been moved to PresentationKit and renamed.")
public class AlertContext: PresentationContext<Alert> {

    @MainActor
    public func present(
        _ alert: @autoclosure @escaping () -> Alert
    ) {
        presentContent(alert())
    }
}

public extension View {

    /// Bind an ``AlertContext`` to the view.
    @available(*, deprecated, message: "This has been moved to PresentationKit")
    func alert(_ context: AlertContext) -> some View {
        alert(
            isPresented: context.isActiveBinding,
            content: context.content ?? { Alert(title: Text("")) }
        )
        .environmentObject(context)
    }
}

/// This key can be used to keep track of the current value.
@available(*, deprecated, message: "This has been moved to PresentationKit")
public struct AlertContextFocusedValueKey: FocusedValueKey {

    public typealias Value = AlertContext
}

@available(*, deprecated, message: "This has been moved to PresentationKit")
public extension FocusedValues {

    var alertContext: AlertContextFocusedValueKey.Value? {
        get { self[AlertContextFocusedValueKey.self] }
        set { self[AlertContextFocusedValueKey.self] = newValue }
    }
}
