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

public extension ColorPickerBar {

    /// This type can be used to config a ``ColorPickerBar``.
    struct Config {

        /// Create a color picker bar configuration.
        ///
        /// - Parameters:
        ///   - addOpacityToPicker: Whether or not to add color picker opacity, by default `true`.
        public init(
            addOpacityToPicker: Bool = true,
            addResetButton: Bool = false,
            resetButtonValue: Color? = nil
        ) {
            self.addOpacityToPicker = addOpacityToPicker
            self.addResetButton = addResetButton
            self.resetButtonValue = resetButtonValue
        }

        /// Whether or not to add color picker opacity.
        public var addOpacityToPicker: Bool

        /// Whether or not to add a reset button to the bar.
        public var addResetButton: Bool

        /// The color to apply when tapping the reset button.
        public var resetButtonValue: Color?
    }
}

public extension ColorPickerBar.Config {

    /// The standard color picker bar configuration.
    static var standard: Self { .init() }
}

public extension View {

    /// Apply a ``ColorPickerBar/Config`` style to the view.
    func colorPickerBarConfig(
        _ config: ColorPickerBar.Config
    ) -> some View {
        self.environment(\.colorPickerBarConfig, config)
    }
}

private extension ColorPickerBar.Config {

    struct Key: EnvironmentKey {

        public static var defaultValue: ColorPickerBar.Config {
            .standard
        }
    }
}

public extension EnvironmentValues {

    var colorPickerBarConfig: ColorPickerBar.Config {
        get { self [ColorPickerBar.Config.Key.self] }
        set { self [ColorPickerBar.Config.Key.self] = newValue }
    }
}
#endif
