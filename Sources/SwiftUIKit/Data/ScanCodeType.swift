//
//  File.swift
//  
//
//  Created by Daniel Saidi on 2021-08-03.
//

import Foundation

/**
 This enum defines the scan code types that can be used with
 a `ScanCodeGenerator`.
 */
public enum ScanCodeType {
    
    case barcode
    case qr
    
    public var name: String {
        switch self {
        case .barcode: return "Barcode"
        case .qr: return "QR Code"
        }
    }
    
    public var ciFilterName: String {
        switch self {
        case .barcode: return "CICode128BarcodeGenerator"
        case .qr: return "CIQRCodeGenerator"
        }
    }
}
