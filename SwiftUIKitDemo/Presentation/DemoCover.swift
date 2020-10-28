//
//  DemoCover.swift
//  SwiftUIKitDemo
//
//  Created by Daniel Saidi on 2020-10-28.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI
import SwiftUIKit

enum DemoCover: FullScreenCoverProvider {
    
    case red, green, blue
    
    var cover: AnyView {
        DemoCoverView(color: color)
            .edgesIgnoringSafeArea(.all)
            .any()
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

struct DemoCoverView: View, DismissableView {
    
    let color: Color
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            color
                .edgesIgnoringSafeArea(.all)
                .navigationBarItems(trailing: Button("Close", action: dismiss))
        }
    }
}
