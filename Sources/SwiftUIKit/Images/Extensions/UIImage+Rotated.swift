//
//  UIImage+Rotated.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2021-08-17.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

#if os(iOS)
import UIKit

public extension UIImage {
    
    /**
     Rotate an image a certain amount of radians.
     */
    func rotated(withRadians radians: Float) -> UIImage? {
        let radians = CGFloat(radians)
        let transform = CGAffineTransform(rotationAngle: radians)
        var newSize = CGRect(origin: .zero, size: size)
            .applying(transform)
            .size
        
        // Trim off the small float values to prevent core graphics from rounding it up
        newSize.width = floor(newSize.width)
        newSize.height = floor(newSize.height)

        UIGraphicsBeginImageContextWithOptions(newSize, false, scale)
        let context = UIGraphicsGetCurrentContext()!

        // Move origin to middle
        context.translateBy(x: newSize.width/2, y: newSize.height/2)
        
        // Rotate around middle
        context.rotate(by: CGFloat(radians))
        
        // Draw the image at its center
        let rect = CGRect(
            x: -size.width/2,
            y: -size.height/2,
            width: size.width,
            height: size.height)
        
        // Draw new image
        draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage
    }
}
#endif
