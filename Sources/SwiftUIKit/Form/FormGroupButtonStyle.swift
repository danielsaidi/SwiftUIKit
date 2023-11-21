//
//  FormGroupButtonStyle.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2021-08-02.
//  Copyright © 2021-2023 Daniel Saidi. All rights reserved.
//

#if os(iOS)
import SwiftUI

/**
 This style can be used to generate horizontal button groups
 that mimics the look of the topmost iOS Contact buttons.
 */
public struct FormGroupButtonStyle: ButtonStyle {
    
    /**
     Create a custom form group button style.
     
     - Parameters:
       - backgroundColor: The background color to apply, by default the standard form background.
       - cornerRadius: The corner radius to apply, by default `10`.
       - disabledOpacity: The disabled opacity to apply, by default `0.5`.
       - labelStyle: The label style to apply, by default `.standard`.
       - padding: The padding to apply, by default `8`.
       - pressedOpacity: The pressed opacity to apply, by default ` 0.5`.
       - shadowStyle: The shadow style to apply, by default `.none`.
     */
    public init(
        backgroundColor: Color? = nil,
        cornerRadius: Double = 10,
        disabledOpacity: Double = 0.5,
        labelStyle: ButtonLabelStyle = .standard,
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
    public var labelStyle: ButtonLabelStyle
    
    /// The padding to apply.
    public var padding: Double
    
    /// The pressed opacity to apply.
    public var pressedOpacity: Double
    
    /// The shadow style to apply.
    public var shadowStyle: ViewShadowStyle
    
    @Environment(\.isEnabled)
    private var isEnabled
    
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

private extension FormGroupButtonStyle {
    
    @ViewBuilder
    var background: some View {
        if let backgroundColor {
            backgroundColor
        } else {
            Color.primary.colorInvert()
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

public extension FormGroupButtonStyle {
    
    /**
     A standard form group button style.
     
     You can override the value to mofify the global default.
     */
    static var standard = FormGroupButtonStyle()
}

public extension ButtonStyle where Self == FormGroupButtonStyle {
    
    /// A standard ``FormGroupButtonStyle``.
    static var formGroup: FormGroupButtonStyle { .standard }
    
    /// A custom ``FormGroupButtonStyle``.
    static func formGroup(
        backgroundColor: Color? = nil,
        cornerRadius: Double = 10,
        disabledOpacity: Double = 0.5,
        labelStyle: Self.ButtonLabelStyle = .standard,
        padding: Double = 8,
        pressedOpacity: Double = 0.5,
        shadowStyle: ViewShadowStyle = .none
    ) -> FormGroupButtonStyle {
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


public extension FormGroupButtonStyle {
    /**
     This style can be used to generate horizontal button groups
     that mimics the look of the topmost iOS Contact buttons.
     */
    struct ButtonLabelStyle: LabelStyle {
        
        /**
         Create a custom form group button style.
         
         - Parameters:
           - spacing: The vertical spacing between the icon and title, by default `7`.
           - color: The color to apply to the icon and title, by default `nil`.
           - iconColor: The color to apply to the icon, by default `nil`.
           - titleFont: The font to apply to the title, by default `.caption2`.
           - titleColor: The color to apply to the title, by default `nil`.
           - titleFont: The font to apply to the title, by default `.caption2`.
         */
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

public extension FormGroupButtonStyle.ButtonLabelStyle {
    
    /**
     A standard button label style.
     
     You can override the value to mofify the global default.
     */
    static var standard = Self()
}

public extension LabelStyle where Self == FormGroupButtonStyle.ButtonLabelStyle {
    
    /// A standard button label style.
    static var formGroup: Self { .init() }
    
    /// A custom button label style.
    static func formGroup(
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

struct FormActionButton_Previews: PreviewProvider {
    
    static var previews: some View {
        VStack {
            Button {} label: { Label("Add something", image: .add) }
                .buttonStyle(.swedish)
                .foregroundColor(.yellow)
            
            HStack {
                Button {} label: { Label("Report Bug", image: .bug) }
                    .tint(Color.green)
                Button {} label: { Label("Camera", image: .camera) }
                    .disabled(true)
                Button {} label: { Label("Photos", image: .camera) }
                    .opacity(0.5)
                Button {} label: { Label("Feedback", image: .feedback) }
            }
            .buttonStyle(.formGroup)
            
        }
        .padding()
        .frame(maxHeight: .infinity)
        .background(Color.black.opacity(0.08).ignoresSafeArea())
    }
}

private extension ButtonStyle where Self == FormGroupButtonStyle {
    
    static var swedish: Self {
        .init(
            backgroundColor: .blue,
            labelStyle: .init(color: .yellow)
        )
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
