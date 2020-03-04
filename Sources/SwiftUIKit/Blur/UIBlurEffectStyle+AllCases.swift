//
//  UIBlurEffectStyle+AllCases.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2019-09-12.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import UIKit

public extension UIBlurEffect.Style {
    
    /**
     This list contains all available `UIBlurEffect` styles.
     */
    static var allCases: [UIBlurEffect.Style] {
        [
            .regular,
            .prominent,
            
            .systemUltraThinMaterial,
            .systemThinMaterial,
            .systemMaterial,
            .systemThickMaterial,
            .systemChromeMaterial,
            
            .systemUltraThinMaterialLight,
            .systemThinMaterialLight,
            .systemMaterialLight,
            .systemThickMaterialLight,
            .systemChromeMaterialLight,
            
            .systemUltraThinMaterialDark,
            .systemThinMaterialDark,
            .systemMaterialDark,
            .systemThickMaterialDark,
            .systemChromeMaterialDark,
            
            .extraLight,
            .light,
            .dark
        ]
    }
}
