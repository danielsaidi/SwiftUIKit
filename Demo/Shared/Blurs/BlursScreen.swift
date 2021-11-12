//
//  BlursScreen.swift
//  Demo
//
//  Created by Daniel Saidi on 2020-11-26.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

#if os(iOS)
import SwiftUI

struct BlursScreen: View {
    
    let blurStyles = UIBlurEffect.Style.allCases
    let gridItem = GridItem(.flexible())
    
    var body: some View {
        ScrollView(.vertical) {
            LazyVGrid(columns: [gridItem, gridItem]) {
                ForEach(blurStyles, id: \.displayName) { style in
                    listItem(for: style)
                }
            }.padding()
        }.navigationTitle("Blurs")
    }
}

private extension BlursScreen {
    
    func listItem(for style: UIBlurEffect.Style) -> some View {
        VStack {
            Image("BlurImage")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .blur(style)
                .cornerRadius(5)
            Text(style.displayName)
                .forceSingleLine()
                .font(.footnote)
        }.padding(.bottom, 20)
    }
}

private extension UIBlurEffect.Style {
    
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

struct BlursScreen_Previews: PreviewProvider {
    
    static var previews: some View {
        NavigationView {
            BlursScreen()
        }
    }
}
#endif
