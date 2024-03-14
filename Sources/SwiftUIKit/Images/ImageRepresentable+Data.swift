//
//  ImageRepresentable+Data.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2022-06-27.
//  Copyright © 2022-2024 Daniel Saidi. All rights reserved.
//

import Foundation

public extension ImageRepresentable {
    
    /// Get resized and compressed JPG data from the image.
    ///
    /// - Parameters:
    ///   - width: The width of the new image, by default `1000`.
    ///   - quality: The compression quality, by default `0.8`.
    func jpegData(
        resizedToWidth width: CGFloat = 1000,
        withCompressionQuality quality: CGFloat = 0.8
    ) -> Data? {
        let resized = self.resized(toWidth: width)
        let image = resized ?? self
        return image.jpegData(compressionQuality: quality)
    }
}
