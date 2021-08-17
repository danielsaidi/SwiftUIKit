//
//  StandardScanCodeGenerator.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2021-08-03.
//  Copyright © 2022 Daniel Saidi. All rights reserved.
//

#if os(iOS) || os(tvOS) || os(macOS)
import SwiftUI

/**
 This is a standard implementation of the `ScanCodeGenerator`
 protocol, that used `CoreImage` to generate scan codes.
 */
public class StandardScanCodeGenerator: ScanCodeGenerator {
    
    public init(scale: CGFloat) {
        self.transform = CGAffineTransform(scaleX: scale, y: scale)
    }
    
    public let transform: CGAffineTransform
    
    public func generateCode(_ type: ScanCodeType, from string: String) -> ImageResource? {
        guard let image = generateCoreImage(of: type, from: string) else { return nil }
        return ImageResource(cgImage: image)
    }
    
    public func generateCodeView(_ type: ScanCodeType, from string: String) -> Image? {
        guard let image = generateCode(type, from: string) else { return nil }
        return Image(imageResource: image)
    }
}

private extension StandardScanCodeGenerator {
    
    var imageScale: CGFloat {
        #if canImport(UIKit)
        UIScreen.main.scale
        #else
        2
        #endif
    }
    
    func generateCoreImage(of type: ScanCodeType, from string: String) -> CGImage? {
        let ciContext = CIContext()
        let data = string.data(using: String.Encoding.utf8)
        guard let filter = CIFilter(name: type.ciFilterName) else { return nil }
        filter.setValue(data, forKey: "inputMessage")
        guard let ciImage = filter.outputImage?.transformed(by: transform) else { return nil }
        return ciContext.createCGImage(ciImage, from: ciImage.extent)
    }
}
#endif

#if os(macOS)
private extension ImageResource {
    
    convenience init(cgImage: CGImage) {
        self.init(cgImage: cgImage, size: .zero)
    }
}
#endif
