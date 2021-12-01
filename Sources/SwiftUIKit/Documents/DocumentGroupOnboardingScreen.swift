//
//  DocumentGroupOnboardingScreen.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2021-12-01.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

import SwiftUI

/**
 This protocol can be implemented by any SwiftUI `View` that
 should be able to present itself from a `DocumentGroup`.
 
 In a `DocumentGroup`-based app, just create a view instance
 in the main application struct's initializer, then show the
 onboarding view by calling ``presentAsOnboarding()``.
 */
public protocol DocumentGroupOnboardingScreen: View {}

public extension DocumentGroupOnboardingScreen {
    
    func presentAsOnboarding() throws {
        #if os(iOS)
        let parent = UIApplication.shared.activeKeyWindows.first?.rootViewController
        guard let parent = parent else { throw DocumentGroupOnboardingError.noParentWindow }
        let sheet = UIHostingController(rootView: body)
        parent.present(sheet, animated: true, completion: nil)
        #else
        throw DocumentGroupOnboardingError.unsupportedPlatform
        #endif
    }
}
