//
//  UIApplication+Window.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2021-12-01.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

#if os(iOS)
import UIKit

public extension UIApplication {
    
    /**
     Get all currently active window scenes.
     */
    var activeWindowScenes: [UIWindowScene] {
        connectedScenes
            .filter { $0.activationState == .foregroundActive }
            .compactMap { $0 as? UIWindowScene }
    }
    
    /**
     Get all currently active windows.
     */
    var activeWindows: [UIWindow] {
        activeWindowScenes
            .flatMap { $0.windows }
    }

    /**
     Get all currently active key windows.
     */
    var activeKeyWindows: [UIWindow] {
        activeWindows
            .filter { $0.isKeyWindow }
    }
}
#endif
