//
//  ErrorAlertConvertible.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2022-05-04.
//  Copyright © 2022-2025 Daniel Saidi. All rights reserved.
//

import SwiftUI

@available(*, deprecated, message: "This has been moved to https://github.com/danielsaidi/PresentationKit")
public protocol ErrorAlertConvertible: Error {

    /// The title to display in the alert.
    var errorTitle: String { get }

    /// The message to display in the alert.
    var errorMessage: String { get }

    /// The text to use for the alert button.
    var errorButtonText: String { get }
}

@available(*, deprecated, message: "This has been moved to https://github.com/danielsaidi/PresentationKit")
public extension ErrorAlertConvertible {

    /// Create an error `Alert`.
    var errorAlert: Alert {
        Alert(
            title: Text(errorTitle),
            message: Text(errorMessage),
            dismissButton: .default(Text(errorButtonText))
        )
    }
}
