//
//  FullSizeView.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-10-01.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI

/**
 This view takes up all available space then places the view
 content in the center.
 */
public struct FullSizeView<Content: View>: View {
    
    public init(@ViewBuilder view: @escaping () -> Content) {
        self.view = view
    }
    
    private let view: () -> Content
    
    public var body: some View {
        FullHeightView {
            FullWidthView {
                view()
            }
        }
    }
}

struct FullSizeView_Previews: PreviewProvider {
    static var previews: some View {
        FullSizeView {
            Text("Hello, World!")
        }.background(Color.red)
    }
}
