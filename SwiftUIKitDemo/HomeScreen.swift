//
//  HomeScreen.swift
//  SwiftUIKitDemo
//
//  Created by Daniel Saidi on 2020-03-04.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI

struct HomeScreen: View {
    
    var body: some View {
        NavigationView {
            List {
                NavigationLink("Gestures", destination: GesturesScreen())
                NavigationLink("Presentation", destination: PresentationScreen())
                NavigationLink("Styles", destination: StylesScreen())
            }.navigationBarTitle("SwiftUIKit Demo")
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
