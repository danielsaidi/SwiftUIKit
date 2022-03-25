//
//  AsyncImage.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-10-01.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import Foundation
import SwiftUI

@available(*, deprecated, message: "Use SwiftUI AsyncImage instead.")
@available(iOS 14, macOS 11.0, tvOS 14, watchOS 7.0, *)
public struct AsyncImage<PlaceholderView: View>: View {
    
    public init(
        url: URL,
        contentMode: ContentMode = .fit,
        @ViewBuilder placeholder: @escaping Placeholder) {
        self.contentMode = contentMode
        self.placeholder = placeholder
        _loader = ObservedObject(wrappedValue: AsyncImageLoader(url: url))
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: loadImage)
    }
    
    public typealias Placeholder = () -> PlaceholderView
    
    private let contentMode: ContentMode
    private let placeholder: Placeholder
    
    @ObservedObject private var loader: AsyncImageLoader

    public var body: some View {
        content
    }
    
    @ViewBuilder
    private var content: some View {
        if let image = loader.image {
            image
                .resizable()
                .aspectRatio(contentMode: contentMode)
        } else {
            placeholder()
        }
    }
    
    private func loadImage() { loader.load() }
}
