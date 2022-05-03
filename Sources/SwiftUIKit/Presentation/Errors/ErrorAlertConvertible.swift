//
//  ErrorAlertConvertible.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2022-05-04.
//  Copyright © 2022 Daniel Saidi. All rights reserved.
//

import SwiftUI

protocol ErrorAlertConvertible: Error {
    
    var errorTitle: String { get }
    var errorMessage: String { get }
}

extension ErrorAlertConvertible {
    
    var errorAlert: Alert {
        Alert(
            title: Text(errorTitle),
            message: Text(errorMessage),
            dismissButton: .default(Text("OK"))     // TODO: Make this configurable
        )
    }
}
