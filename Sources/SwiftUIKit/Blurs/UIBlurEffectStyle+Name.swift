//
//  UIBlurEffectStyle+Name.swift
//  Demo
//
//  Created by Daniel Saidi on 2020-11-26.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

#if os(iOS)
import UIKit

/**
 This extension is currently only used in the demo app.
 */
extension UIBlurEffect.Style {
    
    var name: String {
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
#endif
