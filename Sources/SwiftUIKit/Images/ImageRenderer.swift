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
 You can also define a resolution scale directly in `init`.
 */
public class ImageRenderer<Content: View> {
    @MainActor
    public init(content: Content) {
        self.content = content
        self.scale = UIScreen.main.scale
    }

    @MainActor
    public init(
        content: Content,
        scale: CGFloat? = nil
    ) {
        self.content = content
        self.scale = scale ?? UIScreen.main.scale
    }

    private let content: Content
    @MainActor
    public var scale: CGFloat

    @MainActor
    public var uiImage: UIImage? {
        if #available(iOS 16, *) {
            let renderer = SwiftUI.ImageRenderer(content: content)
            return renderer.uiImage
        } else {
            let dummyController = UIHostingController(rootView: content.edgesIgnoringSafeArea(.all))
            dummyController.view.setNeedsLayout()
            dummyController.view.layoutIfNeeded()
            let contentSize = dummyController.sizeThatFits(in: UIView.layoutFittingExpandedSize)

            let hostingController = UIHostingController(rootView: content.edgesIgnoringSafeArea(.all))
            hostingController.view.bounds.size = contentSize
            let window = UIWindow(frame: CGRect(origin: .zero, size: contentSize))
            window.rootViewController = hostingController
            window.makeKeyAndVisible()

            return hostingController.view.renderedImage(withScale: scale)
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
