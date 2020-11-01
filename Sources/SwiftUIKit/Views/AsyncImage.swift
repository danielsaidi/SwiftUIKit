//
//  AsyncImage.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-10-01.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import Foundation
import SwiftUI

/**
 This view can be used to show an image that is fetched from
 an url using an async network request. A `placeholder` will
 be displayed when an image is being fetched as well as when
 the fetch operation fails.
 */
@available(iOS 14, macOS 11.0, tvOS 14, watchOS 7.0, *)
public struct AsyncImage<PlaceholderView: View>: View {
    
    public init(
        url: URL,
        contentMode: ContentMode = .fit,
        loadDelay: DispatchTimeInterval = .seconds(0),
        @ViewBuilder placeholder: @escaping Placeholder) {
        self.loadDelay = loadDelay
        self.contentMode = contentMode
        self.placeholder = placeholder
        _loader = StateObject(wrappedValue: ImageLoader(url: url))
    }
    
    public typealias Placeholder = () -> PlaceholderView
    
    private let contentMode: ContentMode
    private let loadDelay: DispatchTimeInterval
    private let placeholder: Placeholder
    
    @StateObject private var loader: ImageLoader

    public var body: some View {
        content.onAppear(perform: loadImage)
    }
    
    private var content: some View {
        Group {
            if let image = loader.image {
                image.resizable()
                    .aspectRatio(contentMode: contentMode)
            } else {
                placeholder()
            }
        }
    }
    
    private func loadImage() {
        let queue = DispatchQueue.main
        queue.asyncAfter(deadline: .now() + loadDelay, execute: loader.load)
    }
}

@available(iOS 14, macOS 11.0, tvOS 14, watchOS 7.0, *)
struct AsyncImage_Previews: PreviewProvider {
    
    static var previews: some View {
        let urlString = "https://hips.hearstapps.com/digitalspyuk.cdnds.net/17/38/1505731747-pennywise-teeth-it-movie.jpg?crop=1xw:0.8888888888888888xh;center,top&resize=1200:*"
        let url = URL(string: urlString)
        return AsyncImage(url: url!) {
            Color.gray
        }.aspectRatio(contentMode: .fit)
    }
}
