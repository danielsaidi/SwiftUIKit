//
//  StandardQrCodeGenerator.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-06-06.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

#if os(iOS) || os(tvOS) || os(macOS)
import SwiftUI

public class StandardQrCodeGenerator: QrCodeGenerator {
    
    public init(scale: CGFloat) {
        transform = CGAffineTransform(scaleX: scale, y: scale)
    }
    
    private let transform: CGAffineTransform

    public func generateQRCode(from string: String) -> Image? {
        let ciContext = CIContext()
        let data = string.data(using: String.Encoding.utf8)
        guard let filter = CIFilter(name: "CIQRCodeGenerator") else { return nil }
        filter.setValue(data, forKey: "inputMessage")
        guard
            let ciImage = filter.outputImage?.transformed(by: transform),
            let cgImage = ciContext.createCGImage(ciImage, from: ciImage.extent)
            else { return nil }
        return Image(cgImage, scale: 2, label: Text("QR Code"))
    }
}
#endif
