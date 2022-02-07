//
//  BlurView.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2019-08-30.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

#if os(iOS) || os(tvOS)
import SwiftUI

/**
 This view wraps a `UIView` and applies a `UIKit` blur to it.
 
 You can easily add a blur view to a `SwiftUI` `View`, using
 the `blur(style:)` extension.
 */
@available(*, deprecated, message: "Use the native material approach instead")
public struct BlurView: UIViewRepresentable {
    
    public init(style: UIBlurEffect.Style) {
        self.style = style
    }
    
    private let style: UIBlurEffect.Style
    
    public typealias Context = UIViewRepresentableContext<BlurView>
    
    public func makeUIView(context: Context) -> UIView { createView() }
    
    public func updateUIView(_ uiView: UIView, context: Context) {}
}

@available(*, deprecated, message: "Use the native material approach instead")
extension BlurView {
    
    func createView() -> UIView {
        let view = UIView(frame: .zero)
        let blurView = createBlurView()
        add(blurView, to: view)
        return view
    }
}

@available(*, deprecated, message: "Use the native material approach instead")
private extension BlurView {
    
    func add(_ blurView: UIVisualEffectView, to view: UIView) {
        view.backgroundColor = .clear
        view.insertSubview(blurView, at: 0)
        NSLayoutConstraint.activate([
            blurView.heightAnchor.constraint(equalTo: view.heightAnchor),
            blurView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])
    }
    
    func createBlurView() -> UIVisualEffectView {
        let effect = UIBlurEffect(style: style)
        let view = UIVisualEffectView(effect: effect)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }
}
#endif
