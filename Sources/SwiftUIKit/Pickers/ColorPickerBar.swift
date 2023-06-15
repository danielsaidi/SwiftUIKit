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

 Note that you have to pass in a list of colors. You can use
 `.colorPickerBarColors` for a standard set of colors. 

 This picker supports binding to an optional color, and will
 pass in a non-optional binding to the native color picker.
 */
@available(iOS 15.0, macOS 12.0, *)
public struct ColorPickerBar: View {

    /**
     Create a color picker bar.

     - Parameters:
       - value: The value to bind to.
       - colors: The colors to show in the trailing list, by default `.colorPickerBarColors`.
       - config: The configuration to use, by default `.standard`.
       - style: The style to use, by default `.standard`.
     */
    public init(
        value: Binding<Color>,
        colors: [Color] = .colorPickerBarColors,
        config: Configuration = .standard,
        style: Style = .standard
    ) {
        self.value = value
        self.colors = colors
        self.config = config
        self.style = style
    }

    private let value: Binding<Color>
    private let colors: [Color]
    private let config: Configuration
    private let style: Style

    @Environment(\.colorScheme)
    private var colorScheme

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
public extension ColorPickerBar {

    /// This type can be used to config a ``ColorPickerBar``.
    struct Configuration {

        /**
         Create a color picker bar configuration.

         - Parameters:
           - pickerSupportsOpacity: Whether or not the color picker supports opacity, by default `true`.
         */
        public init(
            pickerSupportsOpacity: Bool = true
        ) {
            self.pickerSupportsOpacity = pickerSupportsOpacity
        }

        /// Whether or not the color picker supports opacity.
        public var pickerSupportsOpacity: Bool

        /// Get the standard configuration.
        public static var standard: Configuration = .init()

        /// Get a configuration that disables picker opacity.
        public static let withoutOpacity: Configuration = .init(
            pickerSupportsOpacity: false
        )
    }

    /// This type can be used to style a ``ColorPickerBar``.
    struct Style {

        /**
         Create a color picker bar configuration.

         - Parameters:
           - spacing: The bar item spacing, by default `10`.
           - colorSize: The size of non-selected colors, by default `20`.
           - selectedColorSize: The size of the selected color, by default `30`.
         */
        public init(
            spacing: Double = 10.0,
            colorSize: Double = 20.0,
            selectedColorSize: Double = 30.0
        ) {
            self.spacing = spacing
            self.colorSize = colorSize
            self.selectedColorSize = selectedColorSize
        }

        /// The bar item spacing.
        public var spacing: Double

        /// The size of non-selected colors.
        var colorSize: Double

        /// The size of the selected color.
        var selectedColorSize: Double

        /// Get the standard style.
        public static var standard: Style = .init()
    }
}

@available(iOS 15.0, macOS 12.0, *)
private extension ColorPickerBar {

    var picker: some View {
        ColorPicker(
            "",
            selection: value,
            supportsOpacity: config.pickerSupportsOpacity
        )
        .fixedSize()
        .padding(.horizontal, style.spacing)
    }

    var scrollView: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: style.spacing) {
                ForEach(Array(colors.enumerated()), id: \.offset) {
                    scrollViewButton(for: $0.element)
                }
            }
            .padding(.horizontal, style.spacing)
            .padding(.vertical, 2)
        }.frame(maxWidth: .infinity)
    }

    func scrollViewButton(for color: Color) -> some View {
        Button {
            value.wrappedValue = color
        } label: {
            let size = scrollViewCircleSize(for: color)
            scrollViewCircle(for: color)
                .frame(width: size, height: size)
                .padding(.vertical, isSelected(color) ? 0 : 5)
                .animation(.default, value: value.wrappedValue)
        }.buttonStyle(.plain)
    }

    @ViewBuilder
    func scrollViewCircle(for color: Color) -> some View {
        Circle()
            .stroke(scrollViewCircleStroke(for: color), lineWidth: 1)
            .background(scrollViewCircleBackground(for: color))
    }

    @ViewBuilder
    func scrollViewCircleBackground(for color: Color) -> some View {
        if color == .clear {
            Image(systemName: "circle.dotted")
                .resizable()
        } else {
            Circle()
                .fill(color)
                .shadow(.badge)
        }
    }

    func scrollViewCircleSize(for color: Color) -> Double {
        isSelected(color) ? style.selectedColorSize : style.colorSize
    }

    func scrollViewCircleStroke(for color: Color) -> Color {
        if color == .black && colorScheme == .dark { return .white }
        return .clear
    }

    var scrollViewDivider: some View {
        Divider()
            .padding(0)
            .frame(maxHeight: style.selectedColorSize)
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

    /// Get a standard list of `ColorPickerBar` colors.
    static var colorPickerBarColors: [Color] {
        [
            .black, .gray, .white,
            .red, .pink, .orange, .yellow,
            .indigo, .purple, .blue, .cyan, .teal, .mint,
            .green, .brown
        ]
    }

    static func colorPickerBarColors(withClearColor: Bool) -> [Color] {
        let standard = colorPickerBarColors
        guard withClearColor else { return standard }
        return [.clear] + standard
    }
}

@available(iOS 15.0, macOS 12.0, *)
struct ColorPickerBar_Previews: PreviewProvider {

    struct Preview: View {

        @State
        private var color1 = Color.red

        @State
        private var color2 = Color.yellow

        @State
        private var color3 = Color.purple

        var pickers: some View {
            VStack(alignment: .leading, spacing: 0) {
                ColorPickerBar(
                    value: $color1,
                    colors: [.red, .green, .blue]
                )
                ColorPickerBar(
                    value: $color2
                )
                ColorPickerBar(
                    value: $color3,
                    colors: .colorPickerBarColors(withClearColor: true)
                )
            }
            .padding(.vertical)
        }

        var body: some View {
            VStack {
                pickers
                pickers
                .background(Color.black)
                .colorScheme(.dark)
            }
        }
    }

    static var previews: some View {
        Preview()
    }
}
#endif
