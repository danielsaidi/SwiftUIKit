//
//  FormActionButton.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2021-08-02.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

#if os(iOS)
import SwiftUI

/**
 This button replicates the horizontally aligned form action
 buttons that are used in e.g. the Contacts app.
 
 `TODO` The private parts are not in extensions, since using
 available annotations on extensions mess up previews. Check
 bck on this when bumping the library to iOS 14 or later.
 */
@available(iOS 14, *)
public struct FormActionButton: View {
    
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
            VStack(spacing: 7) {
                image
                text
            }
        }.buttonStyle(style)
    }
    
    
    // MARK: - Public Functions
    
    /**
     A dimmed action button looks disabled, but can still be
     tapped, which is a nice way to be able to inform a user
     why the button doesn't work.
     */
    public func dimmed(_ val: Bool) -> some View {
        self.opacity(val ? 0.5 : 1)
    }
    
    
    // MARK: - Private Views
    
    private var image: some View {
        icon.resizable()
            .aspectRatio(contentMode: .fit)
            .frame(height: 18)
    }
    
    private var text: some View {
        Text(title)
            .fixedSize()
            .font(.caption2)
            .minimumScaleFactor(0.5)
    }
}

@available(iOS 14, *)
struct FormActionButton_Previews: PreviewProvider {
    
    static func button(
        _ image: Image,
        _ title: String
    ) -> FormActionButton {
        FormActionButton(icon: image, title: title, action: {})
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
#endif
