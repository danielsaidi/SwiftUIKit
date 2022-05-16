//
//  DocumentGroupOnboardingScreen.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2021-12-01.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

#if os(iOS)
import SwiftUI

/**
 This protocol can be implemented by any SwiftUI `View` that
 should be able to present itself from a `DocumentGroup`.

 To use this protocol, just have any view implement it, then
 present is using ``presentFromDocumentGroup()``.
 */
public protocol DocumentGroupSheet: DocumentGroupInspector {}

public extension DocumentGroupSheet {

    /**
     Try to present the view from the current document group.

     This function will throw an error if the view is not in
     a document group hierarchy.
     */
    func presentFromDocumentGroup() throws {
        guard let parent = rootViewController else { throw DocumentGroupSheetError.noParentWindow }
        let sheet = UIHostingController(rootView: body)
        parent.present(sheet, animated: true, completion: nil)
    }
}
#endif
