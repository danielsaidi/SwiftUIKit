//
//  ErrorAlerter.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2022-05-04.
//  Copyright © 2022-2024 Daniel Saidi. All rights reserved.
//

import SwiftUI

/**
 This protocol can be implemented by anything that can alert
 errors, e.g. a view that performs a throwing async function.

 By implementing the protocol, types get access to new alert
 functions as well as the convenient ``tryWithErrorAlert(_:)``
 function, that makes it possible to trigger async functions
 and alert any errors that occur.

 If you throw errors that conform to ``ErrorAlertConvertible``
 you get full control over what's alerted.
 */
public protocol ErrorAlerter {
    
    var alert: AlertContext { get }
}

@MainActor
public extension ErrorAlerter {

    /**
     Alert the provided error.

     If the error is an ``ErrorAlertConvertible``, then this
     presents its ``ErrorAlertConvertible/errorAlert``, else
     the error's `localizedDescription` is alerted.
     */
    func alert(
        error: Error,
        okButtonText: String = "OK"
    ) {
        if let error = error as? ErrorAlertConvertible {
            return alert.present(error.errorAlert)
        }
        alert.present(
            Alert(
                title: Text(error.localizedDescription),
                dismissButton: .default(Text(okButtonText))
            )
        )
    }
}

public extension ErrorAlerter {

    /// This typealias describes an async operation.
    typealias AsyncOperation = () async throws -> Void

    /// This typealias describes a block completion.
    typealias BlockCompletion<ErrorType: Error> = (BlockResult<ErrorType>) -> Void

    /// This typealias describes a block completion result.
    typealias BlockResult<ErrorType: Error> = Result<Void, ErrorType>

    /// This typealias describes a block operation.
    typealias BlockOperation<ErrorType: Error> = (BlockCompletion<ErrorType>) -> Void

    /// Alert the provided error asynchronously.
    @MainActor func alertAsync(
        error: Error,
        okButtonText: String = "OK"
    ) {
        alert(
            error: error,
            okButtonText: okButtonText
        )
    }

    /// Try to perform a block-based operation, and alert if
    /// this operation fails in any way.
    @MainActor func tryWithErrorAlert<ErrorType: Error>(
        _ operation: @escaping BlockOperation<ErrorType>,
        completion: @escaping BlockCompletion<ErrorType>
    ) {
        operation { result in
            switch result {
            case .failure(let error): alertAsync(error: error)
            case .success: break
            }
            completion(result)
        }
    }
    
    /// Try to perform an async operation, and alert if this
    /// operation fails in any way.
    ///
    /// This function wraps an async operation in a task and
    /// alerts any errors that are thrown.
    @MainActor func tryWithErrorAlert(_ operation: @escaping AsyncOperation) {
        Task {
            do {
                try await operation()
            } catch {
                alert(error: error)
            }
        }
    }
}
