//
//  ImagePickerStandardCompletionHandler.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-04-07.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

#if os(iOS)
import UIKit

/**
 This completion handler will return the original image from
 an image picker's info dictionary, if any.
 */
public class ImagePickerStandardCompletionHandler: ImagePickerCompletionHandler {
    
    public init() {}
    
    public var requiresAuthorization: Bool { false }
    
    public func tryGetImage(from info: ImagePickerInfo, completion: @escaping (UIImage?) -> ()) {
        let image = info[.originalImage] as? UIImage
        completion(image)
    }
}
#endif
