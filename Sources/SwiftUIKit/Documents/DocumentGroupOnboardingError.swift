//
//  DocumentGroupOnboardingError.swift
//  OribiWriterKit
//
//  Created by Daniel Saidi on 2021-11-17.
//  Copyright © 2021 Oribi. All rights reserved.
//

import Foundation

/**
 This enum contains errors that can occur when an onboarding
 is presented from a `DocumentGroup`.
 */
public enum DocumentGroupOnboardingError: Error {
    
    /// There was no parent window to present from
    case noParentWindow
    
    /// The platform is not yet supported
    case unsupportedPlatform
}
