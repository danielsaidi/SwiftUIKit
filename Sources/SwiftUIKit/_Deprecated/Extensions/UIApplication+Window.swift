//
//  UIApplication+Window.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2021-12-01.
//  Copyright © 2021-2023 Daniel Saidi. All rights reserved.
//

#if os(iOS)
import UIKit

@available(*, deprecated, message: "These extensions will be removed from SwiftUIKit in 4.0.")
public extension UIApplication {

    /**
     Get all currently active key windows.
     */
    var activeKeyWindows: [UIWindow] {
        activeWindows
            .filter { $0.isKeyWindow }
    }
    
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
}
#endif
