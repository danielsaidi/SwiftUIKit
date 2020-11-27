//
//  GesturesScreen.swift
//  Demo
//
//  Created by Daniel Saidi on 2020-11-26.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

#if os(iOS)
import SwiftUI

struct GesturesScreen: View {
 
    var body: some View {
        DemoList("Gestures") {
            Section(header: Text("About")) {
                DemoListText("SwiftUIKit has additional gestures for SwiftUI.")
            }
            
            Section(header: Text("Gestures")) {
                DemoListLink("Swipe Gesture", .swipeGesture, SwipeGestureScreen())
            }
        }
    }
}

struct GesturesScreen_Previews: PreviewProvider {
    static var previews: some View {
        GesturesScreen()
    }
}
#endif
