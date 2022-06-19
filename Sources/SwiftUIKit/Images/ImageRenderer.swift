//
//  ImageRenderer.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2022-06-19.
//  Copyright © 2022 Daniel Saidi. All rights reserved.
//

#if os(iOS) && compiler(<5.7)
import Foundation
import SwiftUI
import UIKit

/**
 This image renderer mimics the new SwiftUI 4 `ImageRenderer`
 which is only available in iOS 16.0, macOS 13.0, tvOS 16.0,
 and watchOS 9.0.

 You can use this renderer in the same way as the native one.
 The only difference is that you have to provide a size when
 you create an instance, since the rendering requires a size.
 You can also define a resolution scale directly in `init`.
 */
public class ImageRenderer<Content: View> {

    /**
     Create an image renderer with a certain view content.

     - Parameters:
       - content: The view to render.
       - size: The size of the rendered image.
       - scale: The scale of the rendered image.
     */
    @MainActor
    public init(
        content: Content,
        size: CGSize,
        scale: CGFloat? = nil
    ) {
        self.content = content
        self.size = size
        self.scale = scale ?? UIScreen.main.scale
    }

    private let content: Content
    private let size: CGSize

    @MainActor
    public var scale: CGFloat

    /**
     Render the provided view as a UI image.
     */
    @MainActor
    public var uiImage: UIImage {
        let window = UIWindow(frame: CGRect(origin: .zero, size: size))
        let hosting = UIHostingController(rootView: content)
        hosting.view.frame = window.frame
        window.addSubview(hosting.view)
        window.makeKeyAndVisible()
        return hosting.view.renderedImage
    }
}

private extension UIView {

    var renderedImage: UIImage {
        UIGraphicsBeginImageContextWithOptions(bounds.size, false, 0.0)
        let context = UIGraphicsGetCurrentContext()!
        layer.render(in: context)
        let image = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return image
    }
}
#endif
