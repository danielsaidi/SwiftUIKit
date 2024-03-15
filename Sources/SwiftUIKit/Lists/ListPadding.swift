//
//  ListPadding.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2023-08-30.
//  Copyright © 2023-2024 Daniel Saidi. All rights reserved.
//

import SwiftUI

/// This view can be used to add vertical padding to a `List`.
public struct ListPadding: View {
    
    public init(height: CGFloat) {
        self.height = height
    }
    
    private let height: CGFloat
    
    public var body: some View {
        Color.clear.frame(height: height)
            .listRowBackground(Color.clear)
    }
}
