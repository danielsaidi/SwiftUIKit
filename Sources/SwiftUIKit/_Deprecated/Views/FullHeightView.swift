//
//  FullHeightView.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-10-01.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI

@available(*, deprecated, message: "Use frames and alignments instead.")
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
