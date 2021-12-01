//
//  DocumentPresenter.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2021-11-17.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

#if os(iOS)
import SwiftUI

/**
 This protocol can be implemented by any type that should be
 used to present and dismiss documents from a `DocumentGroup`.
 
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
        keyWindow?.rootViewController?.dismiss(animated: true)
    }
}

private extension DocumentPresenter {
    
    var keyWindow: UIWindow? {
        UIApplication.shared.activeKeyWindows.first
    }
}
#endif
