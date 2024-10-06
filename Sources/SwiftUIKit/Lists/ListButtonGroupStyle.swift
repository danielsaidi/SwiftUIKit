//
//  ListButtonGroupStyle.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2021-08-02.
//  Copyright © 2021-2024 Daniel Saidi. All rights reserved.
//

#if os(iOS)
import SwiftUI

/// This button style can generate inline button groups that
/// mimics the look of the topmost iOS Contact buttons.
public struct ListButtonGroupStyle: ButtonStyle {
    
    /// Create a custom form group button style.
    ///
    /// - Parameters:
    ///   - backgroundColor: The background color to apply, by default the standard form background.
    ///   - cornerRadius: The corner radius to apply, by default `10`.
    ///   - disabledOpacity: The disabled opacity to apply, by default `0.5`.
    ///   - labelStyle: The label style to apply, by default `.standard`.
    ///   - padding: The padding to apply, by default `8`.
    ///   - pressedOpacity: The pressed opacity to apply, by default ` 0.5`.
    ///   - shadowStyle: The shadow style to apply, by default `.none`.
    public init(
        backgroundColor: Color? = nil,
        cornerRadius: Double = 10,
        disabledOpacity: Double = 0.5,
        labelStyle: LabelStyle = .standard,
        padding: Double = 8,
        pressedOpacity: Double = 0.5,
        shadowStyle: ViewShadowStyle = .none
    ) {
        self.backgroundColor = backgroundColor
        self.cornerRadius = cornerRadius
        self.disabledOpacity = disabledOpacity
        self.labelStyle = labelStyle
        self.padding = padding
        self.pressedOpacity = pressedOpacity
        self.shadowStyle = shadowStyle
    }
    
    /// The background color to apply.
    public var backgroundColor: Color?
    
    /// The corner radius to apply.
    public var cornerRadius: Double
    
    /// The disabled opacity to apply.
    public var disabledOpacity: Double
    
    /// The label style to apply.
    public var labelStyle: LabelStyle
    
    /// The padding to apply.
    public var padding: Double
    
    /// The pressed opacity to apply.
    public var pressedOpacity: Double
    
    /// The shadow style to apply.
    public var shadowStyle: ViewShadowStyle
    
    @Environment(\.isEnabled)
    private var isEnabled
    
    @Environment(\.colorScheme)
    private var colorScheme
    
    public func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .labelStyle(labelStyle)
            .frame(maxWidth: .infinity)
            .padding(padding)
            .background(background)
            .cornerRadius(cornerRadius)
            .shadow(shadowStyle)
            .opacity(opacity(for: configuration))
    }
}

private extension ListButtonGroupStyle {
    
    @ViewBuilder
    var background: some View {
        if let backgroundColor {
            backgroundColor
        } else {
            Color.listBackground(forScheme: colorScheme)
        }
    }
    
    func opacity(
        for config: Configuration
    ) -> Double {
        if !isEnabled { return disabledOpacity }
        if config.isPressed { return pressedOpacity }
        return 1
    }
}

public extension ListButtonGroupStyle {
    
    /// A standard form group button style.
    ///
    /// You can set this value to mofify the global default.
    static var standard = Self()
}

public extension ListButtonGroupStyle {
    
    /// This style affects the label of a form group button.
    struct LabelStyle: SwiftUI.LabelStyle {
        
        /// Create a custom label style.
        ///
        /// - Parameters:
        ///   - spacing: The vertical spacing between the icon and title, by default `7`.
        ///   - color: The color to apply to the icon and title, by default `nil`.
        ///   - iconColor: The color to apply to the icon, by default `nil`.
        ///   - iconFont: The font to apply to the title, by default `.body`.
        ///   - titleColor: The color to apply to the title, by default `nil`.
        ///   - titleFont: The font to apply to the title, by default `.caption2`.
        public init(
            spacing: Double = 7,
            color: Color? = nil,
            iconColor: Color? = nil,
            iconFont: Font = .body,
            titleColor: Color? = nil,
            titleFont: Font = .caption2
        ) {
            self.spacing = spacing
            self.color = color
            self.iconColor = iconColor
            self.iconFont = iconFont
            self.titleColor = titleColor
            self.titleFont = titleFont
        }
        
        /// The vertical spacing between the icon and title.
        public var spacing: Double
        
        /// The color to apply to the icon and title.
        public var color: Color?
        
        /// The color to apply to the icon.
        public var iconColor: Color?
        
        /// The font to apply to the icon.
        public var iconFont: Font
        
        /// The color to apply to the title.
        public var titleColor: Color?
        
        /// The font to apply to the title.
        public var titleFont: Font
        
        public func makeBody(configuration: Configuration) -> some View {
            VStack(spacing: spacing) {
                Text(" ")
                    .font(iconFont)
                    .opacity(0)
                    .overlay {
                        configuration.icon
                            .font(iconFont)
                            .foregroundStyle(iconColor ?? color ?? .accentColor)
                    }
                configuration.title
                    .font(titleFont)
                    .foregroundStyle(titleColor ?? color ?? .accentColor)
            }
        }
    }
}

public extension ListButtonGroupStyle.LabelStyle {
    
    /// The standard list button group label style.
    static var standard: Self { .init() }
}

public extension LabelStyle where Self == ListButtonGroupStyle.LabelStyle {
    
    /// A standard button label style.
    static var formGroupLabel: Self { .init() }
    
    /// A custom button label style.
    static func formGroupLabel(
        spacing: Double = 7,
        iconFont: Font = .body,
        titleFont: Font = .caption2
    ) -> Self {
        .init(
            spacing: spacing,
            iconFont: iconFont,
            titleFont: titleFont
        )
    }
}

public extension View {

    /// Apply a ``ListButtonGroupStyle`` style to the view.
    func listButtonGroupStyle(
        _ style: ListButtonGroupStyle
    ) -> some View {
        self.environment(\.listButtonGroupStyle, style)
    }
}

private extension ListButtonGroupStyle {

    @MainActor struct Key: @preconcurrency EnvironmentKey {

        public static var defaultValue: ListButtonGroupStyle {
            .init()
        }
    }
}

public extension EnvironmentValues {

    var listButtonGroupStyle: ListButtonGroupStyle {
        get { self [ListButtonGroupStyle.Key.self] }
        set { self [ListButtonGroupStyle.Key.self] = newValue }
    }
}
#endif
