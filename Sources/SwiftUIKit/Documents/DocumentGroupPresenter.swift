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
 This protocol can be implemented by any SwiftUI `View` that
 should be able to handle documents in a `DocumentGroup`.
 
 This protocol adds functionality that's currently broken or
 missing in `DocumentGroup`, such as dismissing documents.
 */
public protocol DocumentGroupPresenter: DocumentGroupInspector {}

public extension DocumentGroupPresenter {
    
    /**
     This function will dismiss the document in an old dirty
     way, since the `presentationMode` approach doesn't work
     not the `dismiss` environment.
     */
    func dismissDocument() {
        rootViewController?.dismiss(animated: true)
    }
}
#endif
