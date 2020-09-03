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
    
    @ObservedObject var context = ToastContext()
    
    var body: some View {
        VStack {
            item(title: "Swipe me!", color: .red)
            item(title: "Swipe me too!", color: .green)
            item(title: "Swipe me tooooo!", color: .blue)
            Spacer()
        }
        .toast(context: context, style: .standard)
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
    
    func handleSwipeUp() { present("Up!") }
    func handleSwipeLeft() { present("Left!") }
    func handleSwipeRight() { present("Right!") }
    func handleSwipeDown() { present("Down!") }
    
    func present(_ text: String) {
        context.present(Text(text))
    }
}

struct SwipeGestureScreen_Previews: PreviewProvider {
    static var previews: some View {
        SwipeGestureScreen()
    }
}
