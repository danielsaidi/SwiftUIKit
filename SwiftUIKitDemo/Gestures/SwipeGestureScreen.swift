//
//  SwipeGestureScreen.swift
//  SwiftUIKitDemo
//
//  Created by Daniel Saidi on 2020-03-05.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI
import SwiftUIKit

struct SwipeGestureScreen: View {
    
    @State private var title = "Swipe me in any direction"
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Color.red.onSwipeGesture(
                    up: self.handleSwipeUp,
                    left: self.handleSwipeLeft,
                    right: self.handleSwipeRight,
                    down: self.handleSwipeDown).cornerRadius(10)
                Text(self.title)
            }.frame(
                width: 0.9*geo.size.width,
                height: 0.9*geo.size.height,
                alignment: .center)
        }.navigationBarTitle("SwipeGesture")
    }
}

private extension SwipeGestureScreen {
    
    func handleSwipeUp() { title = "Up!" }
    func handleSwipeLeft() { title = "Left!" }
    func handleSwipeRight() { title = "Right!" }
    func handleSwipeDown() { title = "Down!" }
}

struct SwipeGestureScreen_Previews: PreviewProvider {
    static var previews: some View {
        SwipeGestureScreen()
    }
}
