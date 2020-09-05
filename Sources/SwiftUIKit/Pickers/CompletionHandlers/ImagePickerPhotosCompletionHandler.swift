//
//  ImagePickerPhotosCompletionHandler.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-04-07.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

#if os(iOS)
import UIKit
import Photos

/**
 This completion handler will return the original image from
 a user's photo library, using a `PHImageRequestOptions`.
 
 The class requires that the app is authorized to access the
 user's photo library.
 */
public class ImagePickerPhotosCompletionHandler: ImagePickerCompletionHandler {
    
    public init() {}
    
    public var requiresAuthorization: Bool { true }
    
    public func tryGetImage(from info: ImagePickerInfo, completion: @escaping (UIImage?) -> Void) {
        guard let asset = info[.phAsset] as? PHAsset else { return completion(nil) }
        let manager = PHImageManager.default()
        let options = PHImageRequestOptions()
        options.version = .original
        options.isSynchronous = true
        options.resizeMode = .none
        manager.requestImageDataAndOrientation(for: asset, options: options) { data, _, _, _ in
            guard let data = data else { return completion(nil) }
            completion(UIImage(data: data))
        }
    }
}
#endif
