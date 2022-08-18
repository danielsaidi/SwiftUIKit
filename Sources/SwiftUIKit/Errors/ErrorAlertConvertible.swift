//
//  ErrorAlertConvertible.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2022-05-04.
//  Copyright © 2022 Daniel Saidi. All rights reserved.
//

import SwiftUI

/**
 This protocol can be implemented by error types that can be
 used together with an ``ErrorAlerter``.
 */
public protocol ErrorAlertConvertible: Error {

    /// The title to display in the alert.
    var errorTitle: String { get }

    /// The message to display in the alert.
    var errorMessage: String { get }
}

public extension ErrorAlertConvertible {

    /**
     Create an error alert for the type.
     */
    var errorAlert: Alert {
        Alert(
            title: Text(errorTitle),
            message: Text(errorMessage),
            dismissButton: .default(Text("OK"))     // TODO: Make this configurable
        )
    }
}
