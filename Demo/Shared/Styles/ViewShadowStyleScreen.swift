//
//  ViewShadowStyleScreen.swift
//  Demo
//
//  Created by Daniel Saidi on 2020-11-26.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI
import SwiftUIKit

struct ViewShadowStyleScreen: View {
 
    var body: some View {
        List {
            Text("""
This style makes it possible to create styles that can be applied to any view.

The styles used in this example are defined in the demo project.
""")
            
            Section(header: Text("Examples")) {
                item(.red, style: .small)
                item(.green, style: .medium)
                item(.blue, style: .large)
            }
        }.navigationTitle("ViewShadowStyle")
    }
}

private extension ViewShadowStyleScreen {
    
    func item(_ color: Color, style: DemoStyle) -> some View {
        color
            .frame(height: 150)
            .shadow(style.style)
            .overlay(Text(style.text))
            .padding()
    }
}

private enum DemoStyle: String {
    
    case small, medium, large
    
    var style: ViewShadowStyle {
        ViewShadowStyle(color: .black, radius: radius, x: 1, y: 1)
    }
    
    var name: String { ".\(rawValue)" }
    
    var radius: CGFloat {
        switch self {
        case .small: return 2
        case .medium: return 5
        case .large: return 10
        }
    }
    
    var text: String {
        "\(name) (\(radius) radius)"
    }
}

struct ShadowStyleScreen_Previews: PreviewProvider {
    
    static var previews: some View {
        NavigationView {
            ViewShadowStyleScreen()
        }
    }
}
