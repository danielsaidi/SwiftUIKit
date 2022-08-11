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
 This generator uses `CoreImage` to generate scan codes.
 */
public class StandardScanCodeGenerator: ScanCodeGenerator {
    
    /**
     Create a new generator instance.
     
     `scale` is a scaling factor that will be applied to the
     generated scan code image. Pick a value that results in
     the best size for your use case.
     
     - Parameters:
       - scale: The scale factor to apply to the generated image.
     */
    public init(scale: CGFloat) {
        self.transform = CGAffineTransform(scaleX: scale, y: scale)
    }
    
    /**
     The transform to apply to the generated scan code image.
     */
    public let transform: CGAffineTransform
    
    /**
     Generate a scan code for the provided type and string.
     */
    public func generateCode(
        _ type: ScanCodeType,
        from string: String
    ) -> ImageRepresentable? {
        guard let image = generateCoreImage(of: type, from: string) else { return nil }
        return ImageRepresentable(cgImage: image)
    }
}

private extension StandardScanCodeGenerator {
    
    func generateCoreImage(
        of type: ScanCodeType,
        from string: String
    ) -> CGImage? {
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
private extension ImageRepresentable {
    
    convenience init(cgImage: CGImage) {
        self.init(cgImage: cgImage, size: .zero)
    }
}
#endif

#if os(iOS) || os(tvOS) || os(macOS)
struct Previews_StandardScanCodeGenerator_Previews: PreviewProvider {
    
    static let generator = StandardScanCodeGenerator(scale: 2)
    
    static var previews: some View {
        VStack {
            generator.generateCodeView(.aztek, from: "123456789")
            generator.generateCodeView(.code128, from: "123456789")
            generator.generateCodeView(.pdf417, from: "123456789")
            generator.generateCodeView(.qr, from: "123456789")
        }
    }
}
#endif
