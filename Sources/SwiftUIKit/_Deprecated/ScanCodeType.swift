//
//  ScanCodeType.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2021-08-03.
//  Copyright © 2021-2025 Daniel Saidi. All rights reserved.
//

import Foundation

@available(*, deprecated, message: "This has been moved to https://github.com/danielsaidi/ScanCodes")
public enum ScanCodeType: String, CaseIterable, Identifiable {
    
    /// An `Aztek` scan code.
    case aztek
    
    /// A `Code-128` barcode.
    case code128
    
    /// A `PDF-417` scan code.
    case pdf417
    
    /// A standard `QR` code.
    case qr
}

@available(*, deprecated, message: "This has been moved to https://github.com/danielsaidi/PickerKit")
public extension ScanCodeType {
    
    /// This type is an alias for ``ScanCodeType/code128``.
    static var barcode: ScanCodeType { .code128 }
    
    /// The display name of the code type.
    var id: String { rawValue }
    
    /// The display name of the code type.
    var name: String { rawValue.capitalized }
    
    /// The filter name to use when generating a scan code.
    var ciFilterName: String {
        switch self {
        case .aztek: return "CIAztecCodeGenerator"
        case .code128: return "CICode128BarcodeGenerator"
        case .pdf417: return "CIPDF417BarcodeGenerator"
        case .qr: return "CIQRCodeGenerator"
        }
    }
}
