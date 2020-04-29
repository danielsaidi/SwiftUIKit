//
//  SwipeGestureScreen.swift
//  SwiftUIKitDemo
//
//  Created by Daniel Saidi on 2020-03-05.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI
import SwiftUIKit

struct SwipeGestureScreen: View, DemoList {
    
    @State private var isToastActive = false
    @State private var toastMessage = "" {
        didSet { isToastActive = true }
    }
    
    var body: some View {
        VStack {
            item(title: "Swipe me!", color: .red)
            item(title: "Swipe me too!", color: .green)
            item(title: "Swipe me tooooo!", color: .blue)
            Spacer()
        }
        .toast(isPresented: $isToastActive, text: toastMessage, background: Color.white)
        .navigationBarTitle("SwipeGesture")
    }
}

private extension SwipeGestureScreen {
    
    func item(title: String, color: Color) -> some View {
        DemoListItem(
            title: title,
            content: color,
            effect: effect
        )
    }
    
    func effect(_ view: AnyView) -> some View {
        view.onSwipeGesture(
            up: self.handleSwipeUp,
            left: self.handleSwipeLeft,
            right: self.handleSwipeRight,
            down: self.handleSwipeDown
        )
    }
    
    func handleSwipeUp() { toastMessage = "Up!" }
    func handleSwipeLeft() { toastMessage = "Left!" }
    func handleSwipeRight() { toastMessage = "Right!" }
    func handleSwipeDown() { toastMessage = "Down!" }
}

struct SwipeGestureScreen_Previews: PreviewProvider {
    static var previews: some View {
        SwipeGestureScreen()
    }
}
