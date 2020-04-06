//
//  ImagePickerCompletionHandler.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-04-07.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import UIKit

/**
 This protocol can be implemented by classes that can import
 images from an `UIImagePickerController` result callback.
 */
public protocol ImagePickerCompletionHandler: AnyObject {
    
    typealias ImagePickerInfo = [UIImagePickerController.InfoKey: Any]
    
    var requiresAuthorization: Bool { get }
    
    func tryGetImage(from info: ImagePickerInfo, completion: @escaping (UIImage?) -> ())
}
