//
//  DemoAppearance.swift
//  Demo
//
//  Created by Daniel Saidi on 2020-12-07.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import Foundation
#if os(iOS)
import UIKit
#endif

final class DemoAppearance {
    
    private init() {}
    
    static func apply() {
        MenuListStyle.defaultStyle = .groupedWithInsets
        
        #if os(iOS)
        if #available(iOS 13.0, *) {
            let navbar = UINavigationBar.appearance()
            let navbarAppearance = UINavigationBarAppearance()
            navbarAppearance.configureWithOpaqueBackground()
            navbarAppearance.backgroundColor = .accent
            navbarAppearance.titleTextAttributes = titleAttributes
            navbarAppearance.largeTitleTextAttributes = largeTitleAttributes
            navbar.tintColor = .white
            navbar.standardAppearance = navbarAppearance
            navbar.scrollEdgeAppearance = navbarAppearance
        }
        #endif
    }
}

#if os(iOS)
private extension DemoAppearance {
    
    static var titleAttributes: [NSAttributedString.Key: Any] {
        [.font: UIFont.systemFont(ofSize: 20, weight: .light), .foregroundColor: UIColor.white, .shadow: shadow]
    }
    
    static var largeTitleAttributes: [NSAttributedString.Key: Any] {
        [.font: UIFont.systemFont(ofSize: 40, weight: .thin), .foregroundColor: UIColor.white, .shadow: shadow]
    }
    
    static var shadow: NSShadow {
        let shadow = NSShadow()
        shadow.shadowBlurRadius = 5
        shadow.shadowColor = UIColor.clear
        return shadow
    }
}
#endif
