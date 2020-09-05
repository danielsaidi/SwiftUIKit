//
//  UIViewWrapper.swift
//  ERASweden-Flippen
//
//  Created by Daniel Saidi on 2020-08-11.
//  Copyright © 2020 Obviuse. All rights reserved.
//

#if os(iOS)
import SwiftUI
import UIKit
  
/**
 This struct can be used to wrap `UIKit` views to be used in
 SwiftUI-based apps. It doesn't update the provided view, so
 only use it when the view is managed outside of the wrapper.
 */
public struct UIViewWrapper: UIViewRepresentable {
    
    public init(view: UIView) {
        self.view = view
    }
    
    private let view: UIView
    
    public func makeUIView(context: Context) -> UIView { view }
    
    public func updateUIView(_ uiView: UIView, context: Context) {}
}
#endif
