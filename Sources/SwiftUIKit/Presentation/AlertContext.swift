//
//  AlertContext.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-06-07.
//  Copyright © 2020-2024 Daniel Saidi. All rights reserved.
//

import SwiftUI

/// This context can be used to present alerts.
///
/// To use this class, just create a `@StateObject` instance
/// in your presenting view and bind the context to the view:
///
/// ```swift
/// extension Alert {
///     static let customAlert = Alert(title: "Hello, world!")
/// }
///
/// struct MyView: View {
///
///     @StateObject var context = AlertContext()
///     var body: some View {
///         Button("Show alert") {
///             context.present(.customAlert)
///         }
///         .alert(context)
///     }
/// }
/// ```
///
/// This view modifier will also inject the provided context
/// as an environment object into the view hierarchy, to let
/// other views in the same hierarchy reuse the same context.
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
    ///
    /// This also injects this context as environment object.
    func alert(_ context: AlertContext) -> some View {
        alert(
            isPresented: context.isActiveBinding,
            content: context.content ?? { Alert(title: Text("")) }
        )
        .environmentObject(context)
    }
}
