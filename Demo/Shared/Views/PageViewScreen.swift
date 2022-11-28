//
//  PageViewScreen.swift
//  Demo
//
//  Created by Daniel Saidi on 2020-11-27.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

#if os(iOS) || os(tvOS) || os(watchOS)
import SwiftUI
import SwiftUIKit

struct PageViewScreen: View {
    
    @State private var colors: [Color] = [.red, .green, .blue]
    @State private var index = 0
    
    var body: some View {
        List {
            Section {
                Text("This view can be used to wrap multiple views in a paged horizontal scroll view.\n\nThe view supports iOS, macOS, tvOS and watchOS.")
            }
            
            Section(header: Text("Example")) {
                PageView(
                    items: colors,
                    currentPageIndex: $index,
                    pageBuilder: pageView)
                .frame(height: 400)
            }
        }.navigationBarTitle("PageView")
    }
}

private extension PageViewScreen {
    
    func pageView(for color: Color) -> some View {
        color
            .frame(height: 400)
            .cornerRadius(20)
    }
}

struct PageViewScreen_Previews: PreviewProvider {
    
    static var previews: some View {
        PageViewScreen()
    }
}
#endif
