//
//  GesturesScreen.swift
//  Demo
//
//  Created by Daniel Saidi on 2020-11-26.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI

struct GesturesScreen: View {
 
    var body: some View {
        MenuList("Gestures") {
            Section {
                MenuListText("SwiftUIKit has additional gestures for SwiftUI.")
            }
            
            Section(header: Text("Gestures")) {
                MenuListLink("Swipe Gesture", .swipeGesture, destination: SwipeGestureScreen())
            }
        }
    }
}

struct GesturesScreen_Previews: PreviewProvider {
    static var previews: some View {
        GesturesScreen()
    }
}
