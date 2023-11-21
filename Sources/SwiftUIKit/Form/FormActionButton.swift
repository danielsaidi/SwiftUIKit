//
//  FormActionButton.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2021-08-02.
//  Copyright © 2021-2023 Daniel Saidi. All rights reserved.
//

#if os(iOS)
import SwiftUI

/**
 This button aims to replicate the horizontal action buttons
 that are used in e.g. the Contacts app.
 */
public struct FormActionButton: View {

    /**
     Create a form action button.

     - Parameters:
       - icon: The topmost icon.
       - title: The button title text.
       - style: The style to apply, by default `.standard`.
       - action: The action to apply when the button is tapped.
     */
    public init(
        icon: Image,
        title: String,
        style: FormActionButtonStyle = .standard,
        action: @escaping () -> Void
    ) {
        self.icon = icon
        self.title = title
        self.style = style
        self.action = action
    }
    
    private let icon: Image
    private let title: String
    private let style: FormActionButtonStyle
    private let action: () -> Void
    
    public var body: some View {
        Button(action: action) {
            VStack(spacing: style.verticalSpacing) {
                image
                text
            }
        }.buttonStyle(style)
    }
}

public extension FormActionButton {

    /**
     Dim the button, which will make it look disabled, while
     still being tappable.

     Dimming buttons is a nice way to make buttons look like
     they are disabled, while still being able to inform the
     user about why they are when they're tapped.
     */
    func dimmed(_ value: Bool = true) -> some View {
        self.opacity(value ? style.disabledOpacity : 1)
    }
}

private extension FormActionButton {

    var image: some View {
        icon.resizable()
            .aspectRatio(contentMode: .fit)
            .frame(height: style.iconHeight)
            .padding(.top, 2)
    }

    var text: some View {
        Text(title)
            .fixedSize()
            .font(.caption2)
            .minimumScaleFactor(0.5)
    }
}

struct FormActionButton_Previews: PreviewProvider {
    
    static func button(
        _ image: Image,
        _ title: String,
        _ style: FormActionButtonStyle = .standard
    ) -> FormActionButton {
        FormActionButton(
            icon: image,
            title: title,
            style: style,
            action: {})
    }
    
    static var previews: some View {
        VStack {
            button(.add, "Add something")

            HStack(spacing: 10) {
                button(.bug, "Report bug")
                button(.camera, "Camera").disabled(true)
                button(.photoLibrary, "Photos").dimmed(true)
                button(.feedback, "Feedback", .swedish)
            }
        }
        .padding()
        .frame(maxHeight: .infinity)
        .background(Color.black.opacity(0.08).ignoresSafeArea())
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
