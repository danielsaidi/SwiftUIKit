//
//  DocumentGroupInspector.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2022-05-16.
//  Copyright © 2022 Daniel Saidi. All rights reserved.
//

#if os(iOS)
import SwiftUI

/**
 This protocol can be implemented by any SwiftUI `View` that
 can inspect the underlying native views of a `DocumentGroup`.
 */
public protocol DocumentGroupInspector: View {}

public extension DocumentGroupInspector {

    /**
     Get the current key window.
     */
    var keyWindow: UIWindow? {
        UIApplication.shared.connectedScenes
            .filter { $0.activationState == .foregroundActive }
            .first(where: { $0 is UIWindowScene })
            .flatMap({ $0 as? UIWindowScene })?.windows
            .first(where: \.isKeyWindow)
    }

    /**
     Get the current key window's root view controller.
     */
    var rootViewController: UIViewController? {
        keyWindow?.rootViewController
    }
}
#endif
