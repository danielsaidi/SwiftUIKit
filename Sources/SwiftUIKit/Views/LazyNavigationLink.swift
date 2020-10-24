//
//  LazyNavigationLink.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-10-13.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI

/**
 This view can be used to improve performance, e.g. when you
 have many navigation links. The destination is wrapped in a
 `LazyView`, which resolves its body upon presentation.
 */
struct LazyNavigationLink<Destination: View, Content: View>: View {
    
    init(destination: Destination, @ViewBuilder content: @escaping () -> Content) {
        self.destination = destination
        self.content = content
    }
    
    let destination: Destination
    let content: () -> Content
    
    var body: some View {
        NavigationLink(destination: LazyView { destination }) {
            content()
        }
    }
}

#if os(iOS) || os(tvOS) || os(macOS)
struct LazyNavigationLink_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            LazyNavigationLink(destination: Text(", world! (\(Date())")) {
                Text("Hello (\(Date())")
            }
        }
    }
}
#endif
