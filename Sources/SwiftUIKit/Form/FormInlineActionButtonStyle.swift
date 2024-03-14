//
//  FormInlineButtonStyle.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2021-08-02.
//  Copyright © 2021-2024 Daniel Saidi. All rights reserved.
//

#if os(iOS)
import SwiftUI

/**
 This style can be used to generate horizontal button groups
 that mimics the look of the topmost iOS Contact buttons.
 */
public struct FormInlineActionButtonStyle: ButtonStyle {
    
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

private extension FormInlineActionButtonStyle {
    
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

public extension FormInlineActionButtonStyle {
    
    /**
     A standard form group button style.
     
     You can override the value to mofify the global default.
     */
    static var standard = FormInlineActionButtonStyle()
}

public extension ButtonStyle where Self == FormInlineActionButtonStyle {
    
    /// A standard ``FormInlineActionButtonStyle``.
    static var formInlineAction: FormInlineActionButtonStyle { .standard }
    
    /// A custom ``FormInlineActionButtonStyle``.
    static func formInlineAction(
        backgroundColor: Color? = nil,
        cornerRadius: Double = 10,
        disabledOpacity: Double = 0.5,
        labelStyle: Self.ButtonLabelStyle = .standard,
        padding: Double = 8,
        pressedOpacity: Double = 0.5,
        shadowStyle: ViewShadowStyle = .none
    ) -> FormInlineActionButtonStyle {
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


public extension FormInlineActionButtonStyle {
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

public extension FormInlineActionButtonStyle.ButtonLabelStyle {
    
    /**
     A standard button label style.
     
     You can override the value to mofify the global default.
     */
    static var standard = Self()
}

public extension LabelStyle where Self == FormInlineActionButtonStyle.ButtonLabelStyle {
    
    /// A standard button label style.
    static var formInlineAction: Self { .init() }
    
    /// A custom button label style.
    static func formInlineAction(
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
        
        var body: some View {
            List {
                Group {
                    Button {} label: { Label("Add something", image: .add) }
                        .buttonStyle(.swedish)
                        .foregroundColor(.yellow)
                    
                    Section {
                        HStack {
                            Button {} label: { Label("Report Bug", image: .bug) }
                                .tint(Color.green)
                            Button {} label: { Label("Camera", image: .camera) }
                                .disabled(true)
                            Button {} label: { Label("Photos", image: .camera) }
                                .opacity(0.5)
                            Button {} label: { Label("Feedback", image: .feedback) }
                        }
                    }
                }
                .listRowInsets(.init(all: 0))
                .listRowBackground(Color.clear)
                
                Section {
                    Text("Row")
                    Text("Row")
                    Text("Row")
                    Text("Row")
                }
            }
        }
    }
    
    return VStack {
        VStack {
            PreviewList()
                .buttonStyle(.formInlineAction)
            PreviewList()
                .buttonStyle(.formInlineAction)
                .environment(\.colorScheme, .dark)
        }
    }
    .frame(maxHeight: .infinity)
    .background(Color.black.opacity(0.08).ignoresSafeArea())
}

private extension ButtonStyle where Self == FormInlineActionButtonStyle {
    
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
