//
//  UIColor+Copy.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2018-02-01.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

#if os(iOS)
import UIKit

public extension UIImage {
    
    /**
     Copies the image as png data to the pasteboard.
     */
    func copyToPasteboard(_ pasteboard: UIPasteboard = .general) -> Bool {
        guard let data = pngData() else { return false }
        pasteboard.setData(data, forPasteboardType: "public.png")
        return true
    }
}
#endif
