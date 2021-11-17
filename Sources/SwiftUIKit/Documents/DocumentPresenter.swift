//
//  DocumentPresenter.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2021-11-17.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

import SwiftUI

/**
 This protocol can be implemented by any type that should be
 used to present a document from a `DocumentGroup`.
 
 This protocol adds functionality that's currently broken or
 missing in the `DocumentGroup` setup, such as dismissing an
 opened document.
 */
public protocol DocumentPresenter: View {}

public extension DocumentPresenter {
    
    /**
     This function will dismiss the document in an old dirty
     way, since the `presentationMode` approach doesn't work
     not the `dismiss` environment.
     */
    func dismissDocument() {
        #if os(iOS)
        keyWindow?.rootViewController?.dismiss(animated: true)
        #endif
    }
}

private extension DocumentPresenter {
    
    var keyWindow: UIWindow? {
        // Get connected scenes
        UIApplication.shared.connectedScenes
        // Keep only active scenes, onscreen and visible to the user
            .filter { $0.activationState == .foregroundActive }
        // Keep only the first `UIWindowScene`
            .first(where: { $0 is UIWindowScene })
        // Get its associated windows
            .flatMap({ $0 as? UIWindowScene })?.windows
        // Finally, keep only the key window
            .first(where: \.isKeyWindow)
    }
}
