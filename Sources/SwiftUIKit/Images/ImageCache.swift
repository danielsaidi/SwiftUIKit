//
//  ImageCache.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2022-07-17.
//  Copyright © 2022-2023 Daniel Saidi. All rights reserved.
//

import Foundation

/**
 This cache type can be used to avoid having to create image
 values for image data over and over.
 */
public class ImageCache {

    /// The cache dictionary that is used to store images.
    public var cache = [String: ImageRepresentable]()

    /// A shared cache instance.
    static let shared = ImageCache()

    /// Store an image into the cache.
    func cache(image: ImageRepresentable, for key: String) {
        cache[key] = image
    }
    
    /// Try to get an image from the cache.
    func cachedImage(for key: String) -> ImageRepresentable? {
        cache[key]
    }

    /// Remove the cached image for a certain key.
    func clearCache(for key: String) {
        cache[key] = nil
    }
}
