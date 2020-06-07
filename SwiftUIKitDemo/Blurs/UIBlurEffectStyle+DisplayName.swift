//
//  UIBlurEffectStyle_DisplayName.swift
//  SwiftUIKitDemo
//
//  Created by Daniel Saidi on 2019-09-12.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import UIKit

extension UIBlurEffect.Style {
    
    var displayName: String {
        switch self {
        case .extraLight: return ".extraLight"
        case .light: return ".light"
        case .dark: return ".dark"
        case .regular: return ".regular"
            
        case .prominent: return ".prominent"
            
        case .systemUltraThinMaterial: return ".systemUltraThinMaterial"
        case .systemThinMaterial: return ".systemThinMaterial"
        case .systemMaterial: return ".systemMaterial"
        case .systemThickMaterial: return ".systemThickMaterial"
        case .systemChromeMaterial: return ".systemChromeMaterial"
            
        case .systemUltraThinMaterialLight: return ".systemUltraThinMaterialLight"
        case .systemThinMaterialLight: return ".systemThinMaterialLight"
        case .systemMaterialLight: return ".systemMaterialLight"
        case .systemThickMaterialLight: return ".systemThickMaterialLight"
        case .systemChromeMaterialLight: return ".systemChromeMaterialLight"
            
        case .systemUltraThinMaterialDark: return ".systemUltraThinMaterialDark"
        case .systemThinMaterialDark: return ".systemThinMaterialDark"
        case .systemMaterialDark: return ".systemMaterialDark"
        case .systemThickMaterialDark: return ".systemThickMaterialDark"
        case .systemChromeMaterialDark: return ".systemChromeMaterialDark"
            
        @unknown default: return "Unknown"
        }
    }
}
