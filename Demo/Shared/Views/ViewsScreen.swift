//
//  ViewsScreen.swift
//  Demo
//
//  Created by Daniel Saidi on 2020-11-26.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI
import SwiftUIKit

struct ViewsScreen: View {
    
    var body: some View {
        List {
            Section {
                Text("SwiftUIKit contains a large collection of additional views for SwiftUI, for instance:")
            }
            
            Section(header: Text("Views")) {
                list1
                list2
            }
        }.navigationTitle("Views")
    }
    
    private var list1: some View {
        Group {
            NavigationLink(destination: CircularProgressBarScreen()) {
                Label("Circular Progress Bar", image: .circularProgressBar)
            }
            
            NavigationLink(destination: DismissableViewScreen()) {
                Label("Dismissable View", image: .dismiss)
            }
            NavigationLink(destination: FetchedDataViewScreen()) {
                Label("Fetched Data View", image: .download)
            }
            
            #if os(iOS)
            NavigationLink(destination: FlipViewScreen()) {
                Label("Flip View", image: .swipeGesture)
            }
            NavigationLink(destination: MultilineTextFieldScreen()) {
                Label("Multiline Text Field", image: .multiline)
            }
            #endif
        }
    }
    
    private var list2: some View {
        Group {
            #if os(iOS) || os(tvOS) || os(watchOS)
            NavigationLink(destination: PageViewScreen()) {
                Label("Page View", image: .pageControl)
            }
            #endif
        }
    }
}

struct ViewsScreen_Previews: PreviewProvider {
    
    static var previews: some View {
        NavigationView {
            ViewsScreen()
        }
    }
}
