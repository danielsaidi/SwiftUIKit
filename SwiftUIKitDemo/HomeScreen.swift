//
//  ContentView.swift
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
                NavigationLink("Blur", destination: BlurScreen())
                NavigationLink("Gestures", destination: GesturesScreen())
            }.navigationBarTitle("SwiftUIKit Demo")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
