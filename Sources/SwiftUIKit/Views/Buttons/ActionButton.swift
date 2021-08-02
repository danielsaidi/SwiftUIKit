//
//  ActionButton.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2021-08-02.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

import SwiftUI

/**
 This view replicates the horizontal action buttons that are
 used in e.g. the Contacts app.
 */
@available(iOS 14, *)
public struct ActionButton: View {
    
    public init(
        icon: Image,
        title: String,
        action: @escaping () -> Void) {
        self.icon = icon
        self.title = title
        self.action = action
    }
    
    private let icon: Image
    private let title: String
    private let action: () -> Void
    
    public var body: some View {
        Button(action: action) {
            VStack(spacing: 7) {
                image
                text
            }
        }.buttonStyle(ActionButtonStyle())
    }
}

@available(iOS 14, *)
public extension ActionButton {
    
    /**
     A dimmed action button looks disabled, but can still be
     tapped, which is a nice way to be able to inform a user
     why the button doesn't work.
     */
    func dimmed(_ val: Bool) -> some View {
        self.opacity(val ? 0.5 : 1)
    }
}

@available(iOS 14, *)
private extension ActionButton {
    
    var image: some View {
        icon.resizable()
            .aspectRatio(contentMode: .fit)
            .frame(height: 18)
    }
    
    var text: some View {
        Text(title)
            .fixedSize()
            .font(.caption2)
            .minimumScaleFactor(0.5)
    }
}

@available(iOS 14, *)
struct ActionButton_Previews: PreviewProvider {
    
    static func button(
        _ image: Image,
        _ title: String) -> ActionButton {
        ActionButton(icon: image, title: title, action: {})
    }
    
    static func preview(_ scheme: ColorScheme) -> some View {
        VStack {
            button(.add, "Add something")
            
            HStack(spacing: 10) {
                button(.bug, "Report bug")
                button(.camera, "Camera").disabled(true)
                button(.photoLibrary, "Photos").dimmed(true)
                button(.feedback, "Feedback")
            }
        }
        .padding()
        .preferredColorScheme(scheme)
        .previewLayout(.sizeThatFits)
        //.environment(\.sizeCategory, .extraLarge)
    }
    
    static var previews: some View {
        preview(.dark)
        preview(.light)
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
