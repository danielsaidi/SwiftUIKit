//
//  Image+ScanCode.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2023-11-21.
//  Copyright © 2021-2025 Daniel Saidi. All rights reserved.
//

#if os(iOS) || os(tvOS) || os(macOS)
import SwiftUI

@available(*, deprecated, message: "This has been moved to https://github.com/danielsaidi/PickerKit")
public extension Image {
    
    /// Create a scan code image with a `value` and `type`.
    init?(
        scanCode value: String,
        type: ScanCodeType,
        scale: CGFloat = 1,
        rotation radians: CGFloat = 0
    ) {
        let image = ImageRepresentable(
            scanCode: value,
            type: type,
            scale: scale,
            rotation: radians
        )
        guard let image else { return nil }
        self.init(image: image)
    }
}

@available(*, deprecated, message: "This has been moved to https://github.com/danielsaidi/PickerKit")
public extension ImageRepresentable {
    
    /// Create a scan code image with a `value` and `type`.
    convenience init?(
        scanCode value: String,
        type: ScanCodeType,
        scale: CGFloat = 1,
        rotation radians: CGFloat = 0
    ) {
        let image = Self.generateScanCode(
            value: value,
            type: type,
            scale: scale,
            rotation: radians
        )
        guard let image else { return nil }
        self.init(cgImage: image)
    }
}

@available(*, deprecated, message: "This has been moved to https://github.com/danielsaidi/PickerKit")
private extension ImageRepresentable {
    
    static func generateScanCode(
        value: String,
        type: ScanCodeType,
        scale: CGFloat,
        rotation radians: CGFloat
    ) -> CGImage? {
        let context = CIContext()
        let data = value.data(using: .utf8)
        guard let filter = CIFilter(name: type.ciFilterName) else { return nil }
        filter.setValue(data, forKey: "inputMessage")
        let transform = CGAffineTransform(scaleX: scale, y: scale)
        let image = filter.outputImage?.transformed(by: transform)
        guard let image else { return nil }
        let result = context.createCGImage(image, from: image.extent)
        guard radians != 0 else { return result }
        return result?.rotated(radians: radians)
    }
}

private extension CGImage {
    
    func rotated(radians: CGFloat) -> CGImage? {
        // Calculate the size of the rotated image
        let rotatedSize = CGRect(x: 0, y: 0, width: width, height: height)
            .applying(CGAffineTransform(rotationAngle: radians))
            .size
        
        // Create a new bitmap context
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        guard let context = CGContext(
            data: nil,
            width: Int(rotatedSize.width),
            height: Int(rotatedSize.height),
            bitsPerComponent: 8,
            bytesPerRow: 0,
            space: colorSpace,
            bitmapInfo: CGImageAlphaInfo.premultipliedFirst.rawValue
        ) else {
            return nil
        }
        
        // Set up the transformation
        context.translateBy(x: rotatedSize.width / 2, y: rotatedSize.height / 2)
        context.rotate(by: radians)
        context.translateBy(x: -CGFloat(width) / 2, y: -CGFloat(height) / 2)
        
        // Draw the image and create a new CGImage
        context.draw(self, in: CGRect(x: 0, y: 0, width: width, height: height))
        return context.makeImage()
    }
}

#if os(macOS)
private extension ImageRepresentable {
    
    convenience init(cgImage: CGImage) {
        self.init(cgImage: cgImage, size: .zero)
    }
}
#endif

#endif
