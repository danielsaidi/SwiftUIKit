//
//  UrlOpener.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-10-05.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI

/**
 This protocol can be implemented by anything that should be
 able to open a URL.
 
 The default implementation uses the shared application when
 you call it in `iOS`. It currently has no implementation on
 the other platforms.
 */
@available(iOSApplicationExtension, unavailable)
public protocol UrlOpener {
    
    typealias OpenUrlCompletion = (Bool) -> Void
    
    func canOpen(_ url: URL) -> Bool
    func tryOpen(_ url: URL, completion: OpenUrlCompletion)
}


// MARK: - Default Implementations

@available(iOSApplicationExtension, unavailable)
public extension UrlOpener {
    
    func canOpen(_ url: URL) -> Bool {
        #if os(iOS)
        return app.canOpenURL(url)
        #else
        assertionFailure("Not yet implemented")
        return false
        #endif
    }
    
    func tryOpen(_ url: URL, completion: OpenUrlCompletion) {
        #if os(iOS)
        app.open(url, options: [:], completionHandler: nil)
        #else
        assertionFailure("Not yet implemented")
        #endif
    }
}


// MARK: - Convenience Functions

@available(iOSApplicationExtension, unavailable)
public extension UrlOpener {
    
    #if os(iOS)
    var app: UIApplication { .shared }
    #endif
    
    func canOpen(_ url: URL?) -> Bool {
        guard let url = url else { return false }
        return canOpen(url)
    }
    
    func canOpen(urlString: String?) -> Bool {
        canOpen(URL(string: urlString ?? ""))
    }
    
    func tryOpen(_ url: URL) {
        tryOpen(url) { _ in }
    }
    
    func tryOpen(_ url: URL?, completion: OpenUrlCompletion = { _ in }) {
        guard let url = url else { return completion(false) }
        tryOpen(url, completion: completion)
    }
    
    func tryOpen(urlString: String?, completion: OpenUrlCompletion = { _ in }) {
        tryOpen(URL(string: urlString ?? ""), completion: completion)
    }
}
