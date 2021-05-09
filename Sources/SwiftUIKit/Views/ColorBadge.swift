//
//  ColorBadge.swift
//  MetaNotes
//
//  Created by Daniel Saidi on 2021-05-09.
//  Copyright © 2021 3drops. All rights reserved.
//

import SwiftUI

/**
 This view renders a color as a circular badge.
 */
public struct ColorBadge: View {
    
    public init(color: Color, size: CGFloat = 20) {
        self.color = color
        self.size = size
    }
    
    public let color: Color
    public let size: CGFloat
    
    public var body: some View {
        color
            .aspectRatio(contentMode: .fit)
            .clipShape(Circle())
            .frame(height: size)
    }
}

struct ColorBadge_Previews: PreviewProvider {
    static var previews: some View {
        ColorBadge(color: .red)
    }
}
