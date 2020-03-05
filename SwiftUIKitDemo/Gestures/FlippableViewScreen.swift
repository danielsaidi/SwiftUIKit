//
//  FlippableViewScreen.swift
//  SwiftUIKitDemo
//
//  Created by Daniel Saidi on 2020-03-05.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI
import SwiftUIKit

struct FlippableViewScreen: View, DemoList {
    var body: some View {
        view.navigationBarTitle("FlippableView")
    }
}

private extension FlippableViewScreen {
    
    var view: some View {
        FlippableView(
            front: side(.red, text: "Flip me!"),
            back: side(.green)
        ).padding()
    }
    
    func side(_ color: Color, text: String = "") -> AnyView {
        ZStack {
            color
            Text(text)
        }.cornerRadius(10).any()
    }
}

struct FlippableViewScreen_Previews: PreviewProvider {
    static var previews: some View {
        FlippableViewScreen()
    }
}
