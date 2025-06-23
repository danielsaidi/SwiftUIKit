//
//  ImageCache.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2022-07-17.
//  Copyright © 2022-2025 Daniel Saidi. All rights reserved.
//

import SwiftUI

/// This type can be used to cache images.
public class ImageCache {
    
    /// Create a cache instance.
    public init() {}

    /// The cache dictionary that is used to store images.
    public var cache = [String: ImageRepresentable]()

    /// Store an image into the cache.
    public func cache(image: ImageRepresentable, for key: String) {
        cache[key] = image
    }
    
    /// Try to get an image from the cache.
    public func cachedImage(for key: String) -> ImageRepresentable? {
        cache[key]
    }

    /// Remove the cached image for a certain key.
    public func clearCache(for key: String) {
        cache[key] = nil
    }
}
