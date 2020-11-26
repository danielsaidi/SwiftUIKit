//
//  CornerRadiusStyleScreen.swift
//  Demo
//
//  Created by Daniel Saidi on 2020-11-26.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI

struct CornerRadiusStyleScreen: View {
    var body: some View {
        DemoList("Corner Radius Style") {
            item(.red, style: .small)
            item(.green, style: .medium)
            item(.blue, style: .large)
        }
    }
}

private extension CornerRadiusStyleScreen {
    
    func item(_ color: Color, style: DemoStyle) -> some View {
        color
            .frame(height: 150)
            .cornerRadius(style.style)
            .overlay(Text(style.text))
            .padding()
    }
}

private enum DemoStyle: String {
    
    case small, medium, large
    
    var style: CornerRadiusStyle {
        CornerRadiusStyle(radius: radius)
    }
    
    var radius: CGFloat {
        switch self {
        case .small: return 5
        case .medium: return 10
        case .large: return 20
        }
    }
    
    var text: String {
        "\(radius) points"
    }
}

struct CornerRadiusStyleScreen_Previews: PreviewProvider {
    static var previews: some View {
        CornerRadiusStyleScreen()
    }
}
