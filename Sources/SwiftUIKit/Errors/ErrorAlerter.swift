//
//  ErrorAlerter.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2022-05-04.
//  Copyright © 2022 Daniel Saidi. All rights reserved.
//

import SwiftUI

public protocol ErrorAlerter {
    
    var alert: AlertContext { get }
}

public extension ErrorAlerter {
    
    typealias AsyncOperation = () async throws -> Void
    typealias BlockResult<ErrorType: Error> = Result<Void, ErrorType>
    typealias BlockCompletion<ErrorType: Error> = (BlockResult<ErrorType>) -> Void
    typealias BlockOperation<ErrorType: Error> = (BlockCompletion<ErrorType>) -> Void

    /**
     Alert the provided error.
     */
    func alertAsync(error: Error) {
        DispatchQueue.main.async {
            alert(error: error)
        }
    }

    /**
     Try performing a block-based operation and alert if the
     operation fails in any way.
     */
    func tryWithErrorAlert<ErrorType: Error>(_ operation: @escaping BlockOperation<ErrorType>, completion: @escaping BlockCompletion<ErrorType>) {
        operation { result in
            switch result {
            case .failure(let error): alertAsync(error: error)
            case .success: break
            }
            completion(result)
        }
    }
    
    /**
     Try performing an async operation and alert if it fails.
     */
    func tryWithErrorAlert(_ operation: @escaping AsyncOperation) {
        Task {
            do {
                try await operation()
            } catch {
                await alert(error: error)
            }
        }
    }
}

@MainActor
public extension ErrorAlerter {
    
    /**
     Alert the provided error.
     */
    func alert(error: Error) {
        if let error = error as? ErrorAlertConvertible {
            return alert.present(error.errorAlert)
        }
        alert.present(Alert(
            title: Text(error.localizedDescription),
            dismissButton: .default(Text("OK"))))        // TODO: Make this configurable
    }
}
