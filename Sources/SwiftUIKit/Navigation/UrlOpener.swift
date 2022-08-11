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
 other platforms and just prints an assertion warning.

 Note that you can use the new `Link` view instead, for apps
 that use SwiftUI 3 and later.
 */
public protocol UrlOpener {
    
    typealias OpenUrlCompletion = (_ success: Bool) -> Void
}


// MARK: - Public Functionality

public extension UrlOpener {
    
    /**
     Whether or not the opener can open the provided `url`.
     */
    func canOpen(_ url: URL) -> Bool {
        #if os(iOS)
        return app.canOpenURL(url)
        #elseif os(macOS)
        return true
        #else
        return failForUnsupportedPlatform()
        #endif
    }
    
    /**
     Whether or not the opener can open the provided `url`.
     */
    func canOpen(_ url: URL?) -> Bool {
        guard let url = url else { return false }
        return canOpen(url)
    }
    
    /**
     Whether or not the opener can open the provided url.
     */
    func canOpen(urlString: String?) -> Bool {
        canOpen(URL(string: urlString ?? ""))
    }
    
    /**
     Try opening the provided `url`.
     */
    func tryOpen(_ url: URL, completion: @escaping OpenUrlCompletion = { _ in }) {
        #if os(iOS)
        app.open(url, options: [:], completionHandler: completion)
        #elseif os(macOS)
        completion(workspace.open(url))
        #else
        failForUnsupportedPlatform()
        #endif
    }
    
    /**
     Try opening the provided `url`.
     */
    func tryOpen(_ url: URL?, completion: @escaping OpenUrlCompletion = { _ in }) {
        guard let url = url else { return completion(false) }
        tryOpen(url, completion: completion)
    }
    
    /**
     Try opening the provided url.
     */
    func tryOpen(urlString: String?, completion: @escaping OpenUrlCompletion = { _ in }) {
        tryOpen(URL(string: urlString ?? ""), completion: completion)
    }
}


// MARK: - Private Functionality

private extension UrlOpener {
        
    #if os(iOS)
    var app: UIApplication { .shared }
    #elseif os(macOS)
    var workspace: NSWorkspace { .shared }
    #endif
        
    @discardableResult
    func failForUnsupportedPlatform() -> Bool {
        assertionFailure("UrlOpener: Unsupported platform")
        return false
    }
}
