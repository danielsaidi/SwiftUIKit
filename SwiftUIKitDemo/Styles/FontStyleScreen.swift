//
//  FontStyleScreen.swift
//  SwiftUIKitDemo
//
//  Created by Daniel Saidi on 2020-03-11.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI
import SwiftUIKit

struct FontStyleScreen: View, DemoList {
    
    var body: some View {
        ScrollView {
            VStack(spacing: listSpacing) {
                item(title: ".abrilFatface - body", color: .red, fontName: abrilFatface, style: .body)
                item(title: ".lobster - headline", color: .green, fontName: lobster, style: .headline)
                item(title: ".luckiestGuy - largeTitle", color: .blue, fontName: luckiestGuy, style: .largeTitle)
            }
        }.navigationBarTitle("FontStyle")
    }
}

private extension FontStyleScreen {
    
    var abrilFatface: String { FontFamily.AbrilFatface.regular.name }
    var lobster: String { FontFamily.Lobster.regular.name }
    var luckiestGuy: String { FontFamily.LuckiestGuy.regular.name }
    
    func item(title: String, color: Color, fontName: String, style: UIFont.TextStyle) -> some View {
        let view = itemView(title: title, color: color, fontName: fontName, style: style)
        return DemoListItem(title: "", content: view, effect: { $0 })
    }
    
    func itemView(title: String, color: Color, fontName: String, style: UIFont.TextStyle) -> some View {
        ZStack {
            color
            Text(title)
                .multilineTextAlignment(.center)
                .font(name: fontName, style: style)
        }
    }
}

struct FontStyleScreen_Previews: PreviewProvider {
    static var previews: some View {
        FontStyleScreen()
    }
}

