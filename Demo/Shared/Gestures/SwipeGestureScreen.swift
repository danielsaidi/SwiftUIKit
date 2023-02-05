//
//  SwipeGestureScreen.swift
//  Demo
//
//  Created by Daniel Saidi on 2020-11-26.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI
import SwiftUIKit

struct SwipeGestureScreen: View {
    
    @State private var text = "Swipe me in any direction"
    
    var body: some View {
        VStack {
            Text("This gesture can be applied to any view and lets you specify an action for each direction.")
            
            Color.blue
                .cornerRadius(5)
                .overlay(Text(text))
                .onTapGesture(perform: handleTap)
                .onSwipeGesture(
                    up: handleSwipeUp,
                    left: handleSwipeLeft,
                    right: handleSwipeRight,
                    down: handleSwipeDown)
        }
        .padding()
        .navigationTitle("SwipeGesture")
    }
}

private extension SwipeGestureScreen {
    
    func handleSwipe(_ direction: String) {
        text = "You swiped \(direction)!"
    }
    
    func handleSwipeDown() { handleSwipe("down") }
    func handleSwipeLeft() { handleSwipe("left") }
    func handleSwipeRight() { handleSwipe("right") }
    func handleSwipeUp() { handleSwipe("up") }
    func handleTap() { text = "You tapped!" }
}

struct SwipeGestureScreen_Previews: PreviewProvider {
    
    static var previews: some View {
        NavigationView {
            SwipeGestureScreen()
        }
    }
}
