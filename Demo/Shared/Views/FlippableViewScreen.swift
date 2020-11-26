//
//  FlippableViewScreen.swift
//  Demo
//
//  Created by Daniel Saidi on 2020-11-26.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI

struct FlippableViewScreen: View {
    
    @State private var isFlipped: Bool = false
    
    var body: some View {
        FlippableView(
            front: side(.blue, "Flip me!"),
            back: side(.red, "Flip me back!")
        )
        .padding()
        .onTapGesture { isFlipped.toggle() }
        .navigationBarTitle("Flippable View")
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
