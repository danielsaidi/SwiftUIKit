//
//  Image+ScanCode.swift
//  SwiftUIKit
//
//
//  Created by Daniel Saidi on 2023-11-21.
//  Copyright © 2021-2023 Daniel Saidi. All rights reserved.
//

#if os(iOS) || os(tvOS) || os(macOS)
import SwiftUI

public extension Image {
    
    /**
     Create a scan code image with a certain value, and of a
     certain type. You can also provide a custom scale.
     */
    init?(
        scanCode value: String,
        type: ScanCodeType,
        scale: CGFloat = 1
    ) {
        let image = ImageRepresentable(
            scanCode: value,
            type: type,
            scale: scale
        )
        guard let image else { return nil }
        self.init(image: image)
    }
}

public extension ImageRepresentable {
    
    /**
     Create a scan code image with a certain value, and of a
     certain type. You can also provide a custom scale.
     */
    convenience init?(
        scanCode value: String,
        type: ScanCodeType,
        scale: CGFloat = 1
    ) {
        let image = Self.generateCode(
            value: value,
            type: type,
            scale: scale
        )
        guard let image else { return nil }
        self.init(cgImage: image)
    }
}

private extension ImageRepresentable {
    
    static func generateCode(
        value: String,
        type: ScanCodeType,
        scale: CGFloat
    ) -> CGImage? {
        let ciContext = CIContext()
        let data = value.data(using: .utf8)
        let transform = CGAffineTransform(scaleX: scale, y: scale)
        guard let filter = CIFilter(name: type.ciFilterName) else { return nil }
        filter.setValue(data, forKey: "inputMessage")
        guard let ciImage = filter.outputImage?.transformed(by: transform) else { return nil }
        return ciContext.createCGImage(ciImage, from: ciImage.extent)
    }
}

#if os(macOS)
private extension ImageRepresentable {
    
    convenience init(cgImage: CGImage) {
        self.init(cgImage: cgImage, size: .zero)
    }
}
#endif

struct Previews_ImageScanCode: PreviewProvider {
    
    static var previews: some View {
        VStack {
            Image(scanCode: "123456789", type: .aztek)
            Image(scanCode: "123456789", type: .code128)
            Image(scanCode: "123456789", type: .pdf417)
            Image(scanCode: "123456789", type: .qr, scale: 5)
        }
    }
}
#endif
