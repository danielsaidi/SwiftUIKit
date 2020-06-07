//
//  DemoAlert.swift
//  SwiftUIKitDemo
//
//  Created by Daniel Saidi on 2020-06-06.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI
import SwiftUIKit

enum DemoAlert: AlertPresentable {
    
    case red, green, blue
    
    var alert: Alert {
        Alert(
            title: Text("\(title.capitalized)"),
            message: Text("Ok, so this alert isn't \(title), but at least it says \"\(title)\". Tap OK to close"),
            dismissButton: Alert.Button.default(Text("OK")))
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
