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
    
    var body: some View {
        VStack {
            SwipeGestureCell(color: .red)
                .padding(.top, topSpacing)
                .navigationBarTitle("SwipeGesture")
            Spacer()
        }
    }
}

struct SwipeGestureScreen_Previews: PreviewProvider {
    static var previews: some View {
        SwipeGestureScreen()
    }
}
