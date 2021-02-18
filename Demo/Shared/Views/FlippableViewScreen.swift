//
//  FlippableViewScreen.swift
//  Demo
//
//  Created by Daniel Saidi on 2020-11-26.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

#if os(iOS)
import SwiftUI

struct FlippableViewScreen: View {
        
    var body: some View {
        VStack {
            MenuListText("This view has a front and a back face and can be flipped by tapping ot swiping.")
            FlippableView(
                front: side(.blue, "Flip me!"),
                back: side(.red, "Flip me back!"),
                isTapEnabled: true,
                isSwipeEnabled: true)
        }
        .padding()
        .navigationTitle("Flippable View")
    }
}

private extension FlippableViewScreen {
    
    func side(_ color: Color, _ text: String) -> some View {
        color
            .cornerRadius(10)
            .overlay(Text(text))
    }
}

struct FlippableViewScreen_Previews: PreviewProvider {
    static var previews: some View {
        FlippableViewScreen()
    }
}
#endif
