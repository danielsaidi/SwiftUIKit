//
//  FontStyleScreen.swift
//  Demo
//
//  Created by Daniel Saidi on 2020-11-26.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI

struct FontStyleScreen: View {
    var body: some View {
        DemoList("Font Style") {
            item(.red, .abril)
            item(.green, .lobster)
            item(.blue, .luckiestGuy)
        }
    }
}

private extension FontStyleScreen {
    
    func item(_ color: Color, _ style: DemoStyle) -> some View {
        color
            .frame(height: 150)
            .cornerRadius(10)
            .overlay(Text(style.text).font(style.style))
            .padding()
    }
}

private enum DemoStyle: String {
    
    case abril, lobster, luckiestGuy
    
    var abrilFatface: String { FontFamily.AbrilFatface.regular.name }
    var lobster: String { FontFamily.Lobster.regular.name }
    var luckiestGuy: String { FontFamily.LuckiestGuy.regular.name }
    
    var style: FontStyle {
        FontStyle(name: fontName, style: .title1)
    }
    
    var fontName: String {
        switch self {
        case .abril: return abrilFatface
        case .lobster: return lobster
        case .luckiestGuy: return luckiestGuy
        }
    }
    
    var text: String {
        "\(rawValue.capitalized)"
    }
}

struct FontStyleScreen_Previews: PreviewProvider {
    static var previews: some View {
        FontStyleScreen()
    }
}
