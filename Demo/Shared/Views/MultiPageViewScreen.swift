//
//  MultiPageViewScreen.swift
//  Demo
//
//  Created by Daniel Saidi on 2020-11-27.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI

struct MultiPageViewScreen: View {
    
    @State private var colors: [Color] = [.red, .green, .blue]
    @State private var index = 0
    
    var body: some View {
        DemoList("MultiPageView") {
            Section(header: Text("About")) {
                DemoListText("This view can be used to wrap multiple views in a page control.")
            }
            
            Section(header: Text("Example")) {
                MultiPageView(
                    items: colors,
                    indexDisplayMode: .automatic,
                    currentPageIndex: $index,
                    pageBuilder: pageView)
            }
        }
    }
}

private extension MultiPageViewScreen {
    
    func pageView(for color: Color) -> some View {
        color
            .frame(height: 150)
            .cornerRadius(20)
    }
}

struct MultiPageViewScreen_Previews: PreviewProvider {
    static var previews: some View {
        MultiPageViewScreen()
    }
}
