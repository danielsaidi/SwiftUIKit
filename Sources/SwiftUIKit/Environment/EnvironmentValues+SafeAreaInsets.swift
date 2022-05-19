//
//  EnvironmentValues+SafeAreaInsets.swift
//  SwiftUI
//
//  Created by Daniel Saidi on 2021-08-20.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

import SwiftUI
#if canImport(UIKit)
import UIKit
#endif

public extension EnvironmentValues {
    
    /**
     Get the safe area insets of the current scene, if any.

     For now, this only works on UIKit supported devices. It
     returns a blank `EdgeInsets` value on all other devices.
     */
    var safeAreaInsets: EdgeInsets {
        self[SafeAreaInsetsKey.self]
    }
}

private struct SafeAreaInsetsKey: EnvironmentKey {
    
    static var defaultValue: EdgeInsets {
        #if os(iOS) || os(tvOS)
        keyWindow?.safeAreaInsets.edgeInsets ?? EdgeInsets()
        #else
        EdgeInsets()
        #endif
    }
}

#if os(iOS) || os(tvOS)
private extension SafeAreaInsetsKey {

    static var keyWindow: UIWindow? {
        UIApplication.shared.keyWindow
    }
}

private extension UIApplication {

    var keyWindow: UIWindow? {
        connectedScenes
            .filter { $0.activationState == .foregroundActive }
            .compactMap { $0 as? UIWindowScene }
            .flatMap { $0.windows }
            .filter { $0.isKeyWindow }
            .first
    }
}

private extension UIEdgeInsets {
    
    var edgeInsets: EdgeInsets {
        EdgeInsets(top: top, leading: left, bottom: bottom, trailing: right)
    }
}
#endif
