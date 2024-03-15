//
//  ColorPickerBar.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2023-06-13.
//  Copyright © 2023-2024 Daniel Saidi. All rights reserved.
//

import Foundation

#if os(iOS) || os(macOS)
import SwiftUI

/**
 This color picker bar can be used to select colors, using a
 SwiftUI `ColorPicker` and a list of colors.

 The picker supports both optional and non-optional bindings.

 The picker uses `.colorPickerBarColors` as the default list
 of colors to list, but you can pass in any colors.
 */
public struct ColorPickerBar: View {

    /// Create a color picker bar with an optional binding.
    ///
    /// - Parameters:
    ///   - value: The value to bind to.
    ///   - colors: The colors to list in the bar, by default `.colorPickerBarColors`.
    public init(
        value: Binding<Color?>,
        colors: [Color] = .colorPickerBarColors
    ) {
        self.value = value
        self.colors = colors
    }

    /// Create a color picker bar with a non-optional binding.
    ///
    /// - Parameters:
    ///   - value: The value to bind to.
    ///   - colors: The colors to list in the bar, by default `.colorPickerBarColors`.
    public init(
        value: Binding<Color>,
        colors: [Color] = .colorPickerBarColors
    ) {
        self.value = .init(get: {
            value.wrappedValue
        }, set: {
            value.wrappedValue = $0 ?? .clear
        })
        self.colors = colors
    }

    private let value: Binding<Color?>
    private let colors: [Color]
    
    @Environment(\.colorPickerBarConfig)
    private var config: Config
    
    @Environment(\.colorPickerBarStyle)
    private var style: Style

    @Environment(\.colorScheme)
    private var colorScheme

    public var body: some View {
        HStack(spacing: 0) {
            picker
            if !colors.isEmpty {
                divider
                scrollView
            }
            if shouldShowResetButton {
                divider
                resetButton
            }
        }
        .labelsHidden()
        .frame(maxHeight: style.selectedColorSize)
    }
}

private extension ColorPickerBar {

    func colorButton(for color: Color) -> some View {
        Button {
            value.wrappedValue = color
        } label: {
            let size = scrollViewCircleSize(for: color)
            colorCircle(for: color)
                .frame(width: size, height: size)
                .padding(.vertical, isSelected(color) ? 0 : 5)
                .animation(style.animation, value: value.wrappedValue)
        }.buttonStyle(.plain)
    }

    @ViewBuilder
    func colorCircle(for color: Color) -> some View {
        Circle()
            .stroke(scrollViewCircleStroke(for: color), lineWidth: 1)
            .background(scrollViewCircleBackground(for: color))
    }

    var divider: some View {
        Divider()
    }

    var picker: some View {
        ColorPicker(
            "",
            selection: value ?? .clear,
            supportsOpacity: config.addOpacityToPicker
        )
        .fixedSize()
        .padding(.trailing, style.spacing)
    }

    var resetButton: some View {
        Button {
            value.wrappedValue = config.resetButtonValue
        } label: {
            style.resetButtonImage
                .resizable()
                .frame(width: style.colorSize, height: style.colorSize)
        }
        .padding(.leading, style.spacing)
    }

    var scrollView: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: style.spacing) {
                ForEach(Array(colors.enumerated()), id: \.offset) {
                    colorButton(for: $0.element)
                }
            }
            .padding(.horizontal, style.spacing)
            .padding(.vertical, 2)
        }.frame(maxWidth: .infinity)
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
}

private extension ColorPickerBar {

    var hasChanges: Bool {
        value.wrappedValue != config.resetButtonValue
    }

    var shouldShowResetButton: Bool {
        config.addResetButton && hasChanges
    }

    func isSelected(_ color: Color) -> Bool {
        value.wrappedValue == color
    }

    func select(color: Color) {
        value.wrappedValue = color
    }
}

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

#Preview {

    struct Preview: View {

        @State
        private var color1: Color = .red

        @State
        private var color2: Color = .yellow

        @State
        private var color3: Color = .purple

        @State
        private var optionalColor: Color?

        @State
        var optionalDouble: Double?

        var pickers: some View {
            VStack(alignment: .leading) {
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
                ColorPickerBar(
                    value: $optionalColor,
                    colors: .colorPickerBarColors(withClearColor: true)
                )
                .colorPickerBarConfig(.init(
                    addOpacityToPicker: false,
                    addResetButton: true,
                    resetButtonValue: nil
                ))
            }
            .padding()
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

    return Preview()
}
#endif
