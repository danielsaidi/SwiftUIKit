//
//  DocumentGroupPresenter.swift
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
 missing in `DocumentGroup`, such as dismissing documents.
 */
public protocol DocumentGroupPresenter: View {}

public extension DocumentGroupPresenter {
    
    /**
     This function will dismiss the document in an old dirty
     way, since the `presentationMode` approach doesn't work
     not the `dismiss` environment.
     */
    func dismissDocument() {
        keyWindow?.rootViewController?.dismiss(animated: true)
    }
}

private extension DocumentGroupPresenter {
    
    var keyWindow: UIWindow? {
        UIApplication.shared.connectedScenes
            .filter { $0.activationState == .foregroundActive }
            .first(where: { $0 is UIWindowScene })
            .flatMap({ $0 as? UIWindowScene })?.windows
            .first(where: \.isKeyWindow)
    }
}
#endif
