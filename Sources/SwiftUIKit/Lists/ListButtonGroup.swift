//
//  ListButtonGroup.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2024-03-15.
//  Copyright © 2024 Daniel Saidi. All rights reserved.
//

#if os(iOS)
import SwiftUI

/// This group applies zero insets and a clear background to
/// render buttons in the content as a horizontal group.
///
/// An example of a similar group in the iOS platform is the
/// quick action button group in the Contact form.
///
/// You can style the view with `.listButtonGroupStyle(...)`.
public struct ListButtonGroup<Content: View>: View {
    
    /// Create a form button group section.
    ///
    /// - Parameters:
    ///   - content: A custom content builder.
    public init(
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.content = content
    }
    
    private let content: () -> Content
    
    @Environment(\.listButtonGroupStyle)
    private var style
    
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
                
                ListButtonGroup {
                    HStack {
                        "Bug".previewButton(.bug)
                        "Camera".previewButton(.camera).disabled(true)
                        "Photos".previewButton(.camera).opacity(0.5)
                        "Feedback".previewButton(.feedback)
                    }
                }
                
                Section {
                    Text("Preview.Row")
                    Text("Preview.Row")
                    Text("Preview.Row")
                    Text("Preview.Row")
                }
            }
        }
    }
    
    return VStack(spacing: 0) {
        PreviewList()
        Divider()
        PreviewList()
            .listButtonGroupStyle(.swedish)
        Divider()
        PreviewList()
            .environment(\.colorScheme, .dark)
    }
    .frame(maxHeight: .infinity)
    .background(Color.black.opacity(0.08).ignoresSafeArea())
}

private extension ButtonStyle where Self == ListButtonGroupStyle {
    
    static var swedish: Self {
        .init(
            backgroundColor: .blue,
            labelStyle: .init(color: .yellow)
        )
    }
}

@MainActor
private extension String {
    
    func previewButton(_ icon: Image) -> some View {
        Button {} label: { Label(LocalizedStringKey(self), icon) }
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
