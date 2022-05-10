//
//  Color+Hex.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2022-05-06.
//  Copyright © 2022 Daniel Saidi. All rights reserved.
//

import SwiftUI

/**
 This extension extends `Color` with ways to be created with
 hex strings and int values.
 */
public extension Color {

    /**
     Initialize a color with a hex value, e.g. `0xabcdef`.

     - Parameters:
       - hex: The hex value to apply.
       - alpha: The alpha value to apply, from 0 to 1.
     */
    init(hex: UInt64, alpha: CGFloat = 1) {
        let color = ColorRepresentable(hex: hex, alpha: alpha)
        self.init(color)
    }

    /**
     Initialize a color with a hex string, e.g. `#abcdef`.

     This initializer supports multiple string formats, like
     `abcdef`, `#abcdef`, `0xabcdef`, `#abcdef`.

     - Parameters:
       - hex: The hex string to parse.
       - alpha: The alpha value to apply, from 0 to 1.
     */
    init?(hex: String, alpha: CGFloat = 1) {
        guard let color = ColorRepresentable(hex: hex, alpha: alpha) else { return nil }
        self.init(color)
    }
}


struct Color_Hex_Previews: PreviewProvider {

    struct Preview: View {

        @State private var font = ""

        var body: some View {
            VStack {
                Color(hex: "0xabcdef")
                Color(hex: "#abcdef", alpha: 0)
                Color(hex: "#abcdef", alpha: 0.5)
                Color(hex: "#abcdef", alpha: 1)
                Color(hex: 0x000000).frame(height: 10)
                Color(hex: 0xffffff).frame(height: 10)
                Color(hex: 0xabcdef)
                Color(hex: 0xabcdef, alpha: 0)
                Color(hex: 0xabcdef, alpha: 0.5)
                Color(hex: 0xabcdef, alpha: 1)
            }.padding()
        }
    }

    static var previews: some View {
        Preview()
    }
}
