//
//  FullHeightView.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-10-01.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI

/**
 This view takes up all available vertical space then places
 the view content in the center.
 */
public struct FullHeightView<Content: View>: View {
    
    public init(@ViewBuilder view: @escaping () -> Content) {
        self.view = view
    }
    
    private let view: () -> Content
    
    public var body: some View {
        VStack {
            Spacer()
            view()
            Spacer()
        }
    }
}

struct FullHeightView_Previews: PreviewProvider {
    static var previews: some View {
        FullHeightView {
            Text("Hello, World!")
        }.background(Color.red)
    }
}
