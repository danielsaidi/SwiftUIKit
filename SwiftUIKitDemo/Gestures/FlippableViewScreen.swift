//
//  FlippableViewScreen.swift
//  SwiftUIKitDemo
//
//  Created by Daniel Saidi on 2020-03-05.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI
import SwiftUIKit

struct FlippableViewScreen: View {
    var body: some View {
        FlippableView(front: side(.red), back: side(.green))
            .padding()
            .navigationBarTitle("FlippableView")
    }
}

private extension FlippableViewScreen {
    
    func side(_ color: Color) -> AnyView {
        AnyView(ZStack {
            color
            Text("Flip me in any direction")
        }.cornerRadius(10))
    }
}

struct FlippableViewScreen_Previews: PreviewProvider {
    static var previews: some View {
        FlippableViewScreen()
    }
}
