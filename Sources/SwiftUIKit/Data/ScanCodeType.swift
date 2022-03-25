//
//  ScanCodeType.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2021-08-03.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

import Foundation

/**
 This enum defines the scan code types that can be used with
 a ``ScanCodeGenerator``.
 */
public enum ScanCodeType {
    
    /// An `Aztek` scan code.
    case aztek
    
    /// A `Code-128` barcode.
    case code128
    
    /// A `PDF-417` scan code.
    case pdf417
    
    /// A standard `QR` code.
    case qr
    
    /**
     The
     */
    public var name: String {
        switch self {
        case .aztek: return "Aztek"
        case .code128: return "Code-128"
        case .pdf417: return "PDF-417"
        case .qr: return "QR Code"
        }
    }
    
    public var ciFilterName: String {
        switch self {
        case .aztek: return "CIAztecCodeGenerator"
        case .code128: return "CICode128BarcodeGenerator"
        case .pdf417: return "CIPDF417BarcodeGenerator"
        case .qr: return "CIQRCodeGenerator"
        }
    }
}

public extension ScanCodeType {
    
    /**
     This type is an alias for ``ScanCodeType/code128``.
     */
    static var barcode: ScanCodeType { .code128 }
}
