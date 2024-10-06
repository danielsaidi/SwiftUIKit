//
//  UIImage+Photos.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2018-02-01.
//  Copyright © 2021-2024 Daniel Saidi. All rights reserved.
//

#if os(iOS)
import UIKit

public extension UIImage {
    
    /// Save the image to the user's photo album.
    ///
    /// This requires the correct permission in `Info.plist`.
    /// Failing to add these permissions before calling this
    /// function will crash the app.
    func saveToPhotos(completion: @escaping (Error?) -> Void) {
        ImageService().saveImageToPhotos(self, completion: completion)
    }
}

private class ImageService: NSObject {
    
    public typealias Completion = (Error?) -> Void

    private var completions = [Completion]()
    
    public func saveImageToPhotos(_ image: UIImage, completion: @escaping (Error?) -> Void) {
        completions.append(completion)
        UIImageWriteToSavedPhotosAlbum(image, self, #selector(saveImageToPhotosDidComplete), nil)
    }
    
    @objc func saveImageToPhotosDidComplete(_ image: UIImage, error: NSError?, contextInfo: UnsafeRawPointer) {
        guard completions.count > 0 else { return }
        completions.removeFirst()(error)
    }
}
#endif
