//
//  FlipViewScreen.swift
//  Demo
//
//  Created by Daniel Saidi on 2020-11-26.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

#if os(iOS)
import SwiftUI
import SwiftUIKit

struct FlipViewScreen: View {
        
    var body: some View {
        VStack {
            MenuListText("These views have a front and a back face and can be flipped by tapping ot swiping.")
            FlipView(
                front: side(.blue, "Flip me horizontally!"),
                back: side(.red, "Flip me back!"),
                tapDirection: .right,
                swipeDirections: [.left, .right])
            FlipView(
                front: side(.blue, "Flip me vertically!"),
                back: side(.red, "Flip me back!"),
                tapDirection: .up,
                swipeDirections: [.up, .down])
        }
        .padding()
        .navigationTitle("Flip View")
    }
}

private extension FlipViewScreen {
    
    func side(_ color: Color, _ text: String) -> some View {
        color
            .cornerRadius(10)
            .overlay(Text(text))
    }
}

struct FlipScreen_Previews: PreviewProvider {
    static var previews: some View {
        FlipViewScreen()
    }
}
#endif
