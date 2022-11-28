//
//  ImagesScreen.swift
//  Demo
//
//  Created by Daniel Saidi on 2020-11-26.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI
import SwiftUIKit

struct ImagesScreen: View {
 
    var body: some View {
        List {
            Section {
                Text("SwiftUIKit has additional gestures for SwiftUI.")
            }
            
            Section(header: Text("Gestures")) {
                NavigationLink(destination: ImageRendererScreen()) {
                    Label("ImageRenderer", image: .swipeGesture)
                }
            }
        }.navigationTitle("Gestures")
    }
}

struct ImagesScreen_Previews: PreviewProvider {
    
    static var previews: some View {
        ImagesScreen()
    }
}
