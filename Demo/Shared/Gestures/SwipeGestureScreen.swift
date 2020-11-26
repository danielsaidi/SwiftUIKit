//
//  SwipeGestureScreen.swift
//  Demo
//
//  Created by Daniel Saidi on 2020-11-26.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI

struct SwipeGestureScreen: View {
    
    @State private var text = "Swipe me in any direction"
    
    var body: some View {
        Color.blue
            .cornerRadius(5)
            .overlay(Text(text))
            .onSwipeGesture(
                up: handleSwipeUp,
                left: handleSwipeLeft,
                right: handleSwipeRight,
                down: handleSwipeDown)
            .padding()
            .navigationTitle("SwipeGesture")
    }
}

private extension SwipeGestureScreen {
    
    func handleSwipe(_ direction: String) {
        text = "You did swipe \(direction)!"
    }
    
    func handleSwipeDown() { handleSwipe("down") }
    func handleSwipeLeft() { handleSwipe("left") }
    func handleSwipeRight() { handleSwipe("right") }
    func handleSwipeUp() { handleSwipe("up") }
}

struct SwipeGestureScreen_Previews: PreviewProvider {
    static var previews: some View {
        SwipeGestureScreen()
    }
}
