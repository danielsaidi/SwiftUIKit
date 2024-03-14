//
//  ImageRepresentable+Size.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2022-06-29.
//  Copyright © 2022-2024 Daniel Saidi. All rights reserved.
//

import Foundation

#if canImport(AppKit)
import AppKit

public extension NSImage {

    /// Create a resized copy of the image.
    func resized(to newSize: CGSize) -> NSImage? {
        let newImage = NSImage(size: newSize)
        newImage.lockFocus()
        let sourceRect = NSRect(x: 0, y: 0, width: size.width, height: size.height)
        let destRect = NSRect(x: 0, y: 0, width: newSize.width, height: newSize.height)
        draw(in: destRect, from: sourceRect, operation: .sourceOver, fraction: CGFloat(1))
        newImage.unlockFocus()
        return newImage
    }
}
#endif


#if canImport(UIKit)
import UIKit

public extension UIImage {

    /// Create a resized copy of the image.
    func resized(to size: CGSize) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        draw(in: CGRect(origin: CGPoint.zero, size: size))
        let result = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return result
    }
}
#endif

public extension ImageRepresentable {

    /// Create a resized copy of the image with a new height.
    func resized(toHeight points: CGFloat) -> ImageRepresentable? {
        let ratio = points / size.height
        let width = size.width * ratio
        let newSize = CGSize(width: width, height: points)
        return resized(to: newSize)
    }

    /// Create a resized copy of the image with a max height.
    func resized(toMaxHeight points: CGFloat) -> ImageRepresentable? {
        if size.height < points { return self }
        return resized(toHeight: points)
    }

    /// Create a resized copy of the image, with a new width.
    func resized(toWidth points: CGFloat) -> ImageRepresentable? {
        let ratio = points / size.width
        let height = size.height * ratio
        let newSize = CGSize(width: points, height: height)
        return resized(to: newSize)
    }

    /// Create a resized copy of the image, with a max width.
    func resized(toMaxWidth points: CGFloat) -> ImageRepresentable? {
        if size.width < points { return self }
        return resized(toWidth: points)
    }
}
