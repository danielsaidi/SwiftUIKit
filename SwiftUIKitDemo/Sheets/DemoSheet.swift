//
//  DemoSheet.swift
//  SwiftUIKitDemo
//
//  Created by Daniel Saidi on 2020-06-06.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI
import SwiftUIKit

enum DemoSheet: SheetPresentable {
    
    case red, green, blue
    
    var sheetView: AnyView {
        color.edgesIgnoringSafeArea(.all).any()
    }
    
    var color: Color {
        switch self {
        case .red: return Color.red
        case .green: return Color.green
        case .blue: return Color.blue
        }
    }
    
    var title: String {
        switch self {
        case .red: return "red"
        case .green: return "green"
        case .blue: return "blue"
        }
    }
}
