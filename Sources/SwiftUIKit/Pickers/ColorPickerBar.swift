//
//  ColorPickerBar.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2023-06-13.
//

import Foundation

#if os(iOS) || os(macOS)
import SwiftUI

/**
 This color picker bar can be used to select colors, using a
 SwiftUI `ColorPicker` and a list of colors.
 */
@available(iOS 15.0, macOS 12.0, *)
public struct ColorPickerBar: View {

    /**
     Create a rich text color picker that binds to a color.

     - Parameters:
       - value: The value to bind to.
       - colors: The colors to show in the trailing list, by default `.colorPickerBarColors`.
     */
    public init(
        value: Binding<Color>,
        colors: [Color] = .colorPickerBarColors
    ) {
        self.value = value
        self.colors = colors
    }

    private let value: Binding<Color>
    private let colors: [Color]

    private let spacing = 10.0

    public var body: some View {
        HStack(spacing: 0) {
            picker
            if !colors.isEmpty {
                scrollViewDivider
                scrollView
            }
        }
        .labelsHidden()
    }
}

@available(iOS 15.0, macOS 12.0, *)
private extension ColorPickerBar {

    var picker: some View {
        ColorPicker("", selection: value)
            .fixedSize()
            .padding(.horizontal, spacing)
    }

    var scrollView: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: spacing) {
                ForEach(Array(colors.enumerated()), id: \.offset) {
                    scrollViewButton(for: $0.element)
                }
            }
            .padding(.horizontal, spacing)
            .padding(.vertical, 2)
        }.frame(maxWidth: .infinity)
    }

    func scrollViewButton(for color: Color) -> some View {
        Button {
            value.wrappedValue = color
        } label: {
            let size: Double = isSelected(color) ? 30 : 20
            Circle()
                .fill(color)
                .shadow(radius: 1, x: 0, y: 1)
                .frame(width: size, height: size)
                .padding(.vertical, isSelected(color) ? 0 : 5)
                .animation(.default, value: value.wrappedValue)
        }.buttonStyle(.plain)
    }

    var scrollViewDivider: some View {
        Divider()
            .padding(0)
            .frame(maxHeight: 30)
    }
}

@available(iOS 15.0, macOS 12.0, *)
private extension ColorPickerBar {

    func isSelected(_ color: Color) -> Bool {
        value.wrappedValue == color
    }

    func select(color: Color) {
        value.wrappedValue = color
    }
}

@available(iOS 15.0, macOS 12.0, *)
public extension Collection where Element == Color {

    /// Get the standard `ColorPickerBar` colors.
    static var colorPickerBarColors: [Color] {
        [
            .black, .gray, .white,
            .red, .pink, .orange, .yellow,
            .indigo, .purple, .blue, .cyan, .teal, .mint,
            .green, .brown
        ]
    }
}

@available(iOS 15.0, macOS 12.0, *)
struct ColorPickerBar_Previews: PreviewProvider {

    struct Preview: View {

        @State
        private var color = Color.black

        var body: some View {
            VStack(alignment: .leading, spacing: 0) {
                ColorPickerBar(
                    value: $color
                )
                ColorPickerBar(
                    value: $color,
                    colors: [.red, .green, .blue]
                )
            }.padding(.leading)
        }
    }

    static var previews: some View {
        Preview()
    }
}
#endif
