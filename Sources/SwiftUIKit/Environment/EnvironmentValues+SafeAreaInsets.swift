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
     Get the safe area insets of the key window, if any.

     For now, this only works on UIKit supported devices. It
     returns a blank `EdgeInsets` value on all other devices.
     */
    var safeAreaInsets: EdgeInsets {
        self[SafeAreaInsetsKey.self]
    }
}

private struct SafeAreaInsetsKey: EnvironmentKey {
    
    static var defaultValue: EdgeInsets {
        #if canImport(UIKit)
        let windows = UIApplication.shared.windows
        let keyWindow = windows.first { $0.isKeyWindow }
        return keyWindow?.safeAreaInsets.insets ?? EdgeInsets()
        #else
        EdgeInsets()
        #endif
    }
}

#if canImport(UIKit)
private extension UIEdgeInsets {
    
    var insets: EdgeInsets {
        EdgeInsets(top: top, leading: left, bottom: bottom, trailing: right)
    }
}
#endif
