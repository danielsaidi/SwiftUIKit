//
//  FormButtonGroupStyle.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2021-08-02.
//  Copyright © 2021-2024 Daniel Saidi. All rights reserved.
//

#if os(iOS)
import SwiftUI

/// This button style can generate inline button groups that
/// mimics the look of the topmost iOS Contact buttons.
public struct FormButtonGroupStyle: ButtonStyle {
    
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

private extension FormButtonGroupStyle {
    
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

public extension FormButtonGroupStyle {
    
    /// A standard form group button style.
    ///
    /// You can set this value to mofify the global default.
    static var standard = Self()
}

public extension ButtonStyle where Self == FormButtonGroupStyle {
    
    /// A standard ``FormButtonGroupStyle``.
    static var formGroup: Self { .standard }
    
    /// A custom ``FormButtonGroupStyle``.
    static func formGroup(
        backgroundColor: Color? = nil,
        cornerRadius: Double = 10,
        disabledOpacity: Double = 0.5,
        labelStyle: Self.LabelStyle = .standard,
        padding: Double = 8,
        pressedOpacity: Double = 0.5,
        shadowStyle: ViewShadowStyle = .none
    ) -> Self {
        .init(
            backgroundColor: backgroundColor,
            cornerRadius: cornerRadius,
            disabledOpacity: disabledOpacity,
            labelStyle: labelStyle,
            padding: padding,
            pressedOpacity: pressedOpacity,
            shadowStyle: shadowStyle
        )
    }
}

public extension FormButtonGroupStyle {
    
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

public extension FormButtonGroupStyle.LabelStyle {
    
    /// A standard label style.
    ///
    /// You can set this style to affect the global default.
    static var standard = Self()
}

public extension LabelStyle where Self == FormButtonGroupStyle.LabelStyle {
    
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

#Preview {
    
    struct PreviewList: View {
        
        let style: FormButtonGroupStyle?
        
        var body: some View {
            List {
                "Add something".previewButton(.add)
                
                FormButtonGroupSection(style: style ?? .standard) {
                    HStack {
                        "Report Bug".previewButton(.bug)
                        "Camera".previewButton(.camera).disabled(true)
                        "Photos".previewButton(.camera).opacity(0.5)
                        "Feedback".previewButton(.feedback)
                    }
                }
                
                Section {
                    Text("Row")
                    Text("Row")
                    Text("Row")
                    Text("Row")
                }
            }
        }
    }
    
    return VStack(spacing: 0) {
        PreviewList(style: nil)
        Divider()
        PreviewList(style: .swedish)
        Divider()
        PreviewList(style: nil)
            .environment(\.colorScheme, .dark)
    }
    .frame(maxHeight: .infinity)
    .background(Color.black.opacity(0.08).ignoresSafeArea())
}

private extension ButtonStyle where Self == FormButtonGroupStyle {
    
    static var swedish: Self {
        .init(
            backgroundColor: .blue,
            labelStyle: .init(color: .yellow)
        )
    }
}

private extension String {
    
    func previewButton(_ icon: Image) -> some View {
        Button {} label: { Label(self, image: icon) }
    }
}

private extension Image {
    
    static let add = systemImage("plus")
    static let bug = systemImage("ladybug")
    static let camera = systemImage("camera")
    static let feedback = systemImage("envelope")
    static let photoLibrary = systemImage("photo.on.rectangle.angled")
    
    static func systemImage(_ name: String) -> Image {
        Image(systemName: name)
    }
}
#endif
