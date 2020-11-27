//
//  PageViewScreen.swift
//  Demo
//
//  Created by Daniel Saidi on 2020-11-27.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI

struct PageViewScreen: View {
    
    @State private var colors: [Color] = [.red, .green, .blue]
    @State private var index = 0
    
    var body: some View {
        DemoList("PageView") {
            Section(header: Text("About")) {
                DemoListText("This view can be used to wrap multiple views in a paged horizontal scroll view.")
            }
            
            Section(header: Text("Example")) {
                PageView(
                    items: colors,
                    indexDisplayMode: .automatic,
                    currentPageIndex: $index,
                    pageBuilder: pageView)
            }
        }
    }
}

private extension PageViewScreen {
    
    func pageView(for color: Color) -> some View {
        color
            .frame(height: 150)
            .cornerRadius(20)
    }
}

struct PageViewScreen_Previews: PreviewProvider {
    static var previews: some View {
        PageViewScreen()
    }
}
