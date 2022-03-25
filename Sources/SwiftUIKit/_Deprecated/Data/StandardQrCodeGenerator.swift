//
//  StandardQrCodeGenerator.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-06-06.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

#if os(iOS) || os(tvOS) || os(macOS)
import SwiftUI

@available(*, deprecated, message: "Use StandardScanCodeGenerator instead")
public class StandardQrCodeGenerator: StandardScanCodeGenerator, QrCodeGenerator {
    
    public func generateQRCode(from string: String) -> Image? {
        generateCodeView(.qr, from: string)
    }
}
#endif
