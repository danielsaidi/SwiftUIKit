//
//  Color+Hex.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2022-05-06.
//  Copyright © 2022-2024 Daniel Saidi. All rights reserved.
//

import SwiftUI

public extension Color {

    /// Create a color with an integer hex, e.g. `0xabcdef`.
    ///
    /// - Parameters:
    ///   - hex: The hex value to apply.
    ///   - alpha: The alpha value to apply, from 0 to 1.
    init(hex: UInt64, alpha: CGFloat = 1) {
        let color = ColorRepresentable(hex: hex, alpha: alpha)
        self.init(color)
    }

    /// Create a color with a string hex, e.g. `#abcdef`,
    ///
    /// This supports multiple string formats, like `abcdef`,
    /// `#abcdef`, `0xabcdef`, and `#abcdef`.
    ///
    /// - Parameters:
    ///   - hex: The hex string to parse.
    ///   - alpha: The alpha value to apply, from 0 to 1.
    init?(hex: String, alpha: CGFloat = 1) {
        guard let color = ColorRepresentable(hex: hex, alpha: alpha) else { return nil }
        self.init(color)
    }
    
    /// Create a color with an integer hex, e.g. `0xabcdef`.
    ///
    /// - Parameters:
    ///   - hex: The hex value to apply.
    ///   - alpha: The alpha value to apply, from 0 to 1.
    static func hex(_ hex: UInt64, alpha: CGFloat = 1) -> Color {
        Color(hex: hex, alpha: alpha)
    }

    /// Create a color with a string hex, e.g. `#abcdef`,
    ///
    /// This supports multiple string formats, like `abcdef`,
    /// `#abcdef`, `0xabcdef`, and `#abcdef`.
    ///
    /// - Parameters:
    ///   - hex: The hex string to parse.
    ///   - alpha: The alpha value to apply, from 0 to 1.
    static func hex(_ hex: String, alpha: CGFloat = 1) -> Color? {
        Color(hex: hex, alpha: alpha)
    }
}

#Preview {

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

    return Preview()
}

/// This extension extends `ColorRepresentable` with ways to
/// be created with hex strings and int values.
public extension ColorRepresentable {

    /// Initialize a color with a hex value, e.g. `0xabcdef`.
    ///
    /// - Parameters:
    ///   - hex: The hex value to apply.
    ///   - alpha: The alpha value to apply, from 0 to 1.
    convenience init(hex: UInt64, alpha: CGFloat = 1) {
        let r = CGFloat((hex >> 16) & 0xff) / 255
        let g = CGFloat((hex >> 08) & 0xff) / 255
        let b = CGFloat((hex >> 00) & 0xff) / 255
        self.init(red: r, green: g, blue: b, alpha: alpha)
    }

    /// Initialize a color with a hex string, e.g. `#abcdef`.
    ///
    /// This supports multiple string formats, like `abcdef`,
    /// `#abcdef`, `0xabcdef`, and `#abcdef`.
    ///
    /// - Parameters:
    ///   - hex: The hex string to parse.
    ///   - alpha: The alpha value to apply, from 0 to 1.
    convenience init?(hex: String, alpha: CGFloat = 1) {
        let hex = hex.cleanedForHex()
        guard hex.conforms(to: "[a-fA-F0-9]+") else { return nil }
        let scanner = Scanner(string: hex)
        var hexNumber: UInt64 = 0
        guard scanner.scanHexInt64(&hexNumber) else { return nil }
        self.init(hex: hexNumber, alpha: alpha)
    }
}

private extension String {

    func cleanedForHex() -> String {
        if hasPrefix("0x") {
            return String(dropFirst(2))
        }
        if hasPrefix("#") {
            return String(dropFirst(1))
        }
        return self
    }

    func conforms(to pattern: String) -> Bool {
        let pattern = NSPredicate(format: "SELF MATCHES %@", pattern)
        return pattern.evaluate(with: self)
    }
}
