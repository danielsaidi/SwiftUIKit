//
//  SwipeGestureCell.swift
//  SwiftUIKitDemo
//
//  Created by Daniel Saidi on 2020-03-05.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI
import SwiftUIKit

struct SwipeGestureCell: View {
    
    var color: Color
    @State private var title: String = "Swipe me!"
    
    var body: some View {
        DemoListCell(
            content: stack,
            effect: effect
        )
    }
}

private extension SwipeGestureCell {
    
    var stack: some View {
        ZStack {
            color
            Text(title)
        }
    }
    
    func effect(_ view: AnyView) -> some View {
        view.onSwipeGesture(
            up: self.handleSwipeUp,
            left: self.handleSwipeLeft,
            right: self.handleSwipeRight,
            down: self.handleSwipeDown
        )
    }
    
    func handleSwipeUp() { title = "Up!" }
    func handleSwipeLeft() { title = "Left!" }
    func handleSwipeRight() { title = "Right!" }
    func handleSwipeDown() { title = "Down!" }
}

struct SwipeGestureCell_Previews: PreviewProvider {
    static var previews: some View {
        SwipeGestureCell(color: .green)
    }
}
