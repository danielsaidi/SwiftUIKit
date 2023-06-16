//
//  ImageRenderer.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2022-06-19.
//  Copyright © 2022 Daniel Saidi. All rights reserved.
//

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
    @MainActor
    public init(content: Content) {
        self.content = content
        self.size = UIScreen.main.bounds.size
        self.scale = UIScreen.main.scale
    }

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

    @MainActor
    public var uiImage: UIImage? {
        if #available(iOS 16, *) {
            let renderer = SwiftUI.ImageRenderer(content: content)
            return renderer.uiImage
        } else {
            let window = UIWindow(frame: CGRect(origin: .zero, size: size))
            let hosting = UIHostingController(rootView: content)
            hosting.view.frame = window.frame
            window.addSubview(hosting.view)
            window.makeKeyAndVisible()
            return hosting.view.renderedImage(withScale: scale)
        }
    }
}

private extension UIView {
    func renderedImage(withScale scale: CGFloat) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(bounds.size, false, scale)
        let context = UIGraphicsGetCurrentContext()!
        layer.render(in: context)
        let image = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return image
    }
}
