//
//  FullWidthView.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-10-01.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI

/**
 This view takes up all available horizontal space then puts
 the view content in the center.
 */
public struct FullWidthView<Content: View>: View {
    
    public init(@ViewBuilder view: @escaping () -> Content) {
        self.view = view
    }
    
    private let view: () -> Content
    
    public var body: some View {
        HStack {
            Spacer()
            view()
            Spacer()
        }
    }
}

struct FullWidthView_Previews: PreviewProvider {
    static var previews: some View {
        FullWidthView {
            CircularProgressView()
        }.background(Color.red)
    }
}
