//
//  FormButtonGroup.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2024-03-15.
//  Copyright © 2024 Daniel Saidi. All rights reserved.
//

#if os(iOS)
import SwiftUI

/// This group renders a section that applies the insets and
/// backgrounds needed to render as an iOS form button group.
///
/// Examples of such a group are the quick action buttons in
/// the Contact form.
///
/// You can apply a group style with `.formButtonGroupStyle`.
public struct FormButtonGroup<Content: View>: View {
    
    /// Create a form button group section.
    ///
    /// - Parameters:
    ///   - style: The style to apply, by default ``FormButtonGroupStyle/standard``.
    ///   - content: A custom content builder.
    public init(
        style: FormButtonGroupStyle = .standard,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.style = style
        self.content = content
    }
    
    private let style: FormButtonGroupStyle
    private let content: () -> Content
    
    public var body: some View {
        Section {
            content()
        }
        .buttonStyle(style)
        .listRowInsets(.init(all: 0))
        .listRowBackground(Color.clear)
    }
}

#Preview {
    
    struct PreviewList: View {
        
        var body: some View {
            List {
                "Add something".previewButton(.add)
                
                FormButtonGroup() {
                    HStack {
                        "Report Bug".previewButton(.bug)
                        "Camera".previewButton(.camera).disabled(true)
                        "Photos".previewButton(.camera).opacity(0.5)
                        "Feedback".previewButton(.feedback)
                    }
                }
            }
        }
    }
    
    return VStack(spacing: 0) {
        PreviewList()
        PreviewList()
            .environment(\.colorScheme, .dark)
    }
    .frame(maxHeight: .infinity)
    .background(Color.black.opacity(0.08).ignoresSafeArea())
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
