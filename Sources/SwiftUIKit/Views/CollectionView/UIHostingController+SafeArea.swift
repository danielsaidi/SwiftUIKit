//
//  UIHostingController+SafeArea.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-11-10.
//  Copyright © 2020 Daniel Saidi. All rights reserved.

#if os(iOS) || os(tvOS)
import Foundation
import SwiftUI

/**
 Credits to `@defagos`, who created this as part of his work
 to bring amazing, performant collection views to `SwiftUI`:
 https://github.com/defagos/SwiftUICollection
 */
public extension UIHostingController {
    
    /**
     Create a hosting controller that wraps the root SwiftUI
     view, with an additional option to ignore the safe area.
     */
    convenience init(rootView: Content, ignoreSafeArea: Bool) {
        self.init(rootView: rootView)
        if ignoreSafeArea {
            disableSafeArea()
        }
    }
}

private extension UIHostingController {
    
    /**
     Disable the safe area of the embedded SwiftUI view.
     */
    func disableSafeArea() {
        guard let viewClass = object_getClass(view) else { return }
        let viewSubclassName = String(cString: class_getName(viewClass)).appending("_IgnoreSafeArea")
        if let viewSubclass = NSClassFromString(viewSubclassName) {
            object_setClass(view, viewSubclass)
        } else {
            guard let viewClassNameUtf8 = (viewSubclassName as NSString).utf8String else { return }
            guard let viewSubclass = objc_allocateClassPair(viewClass, viewClassNameUtf8, 0) else { return }
            
            if let method = class_getInstanceMethod(UIView.self, #selector(getter: UIView.safeAreaInsets)) {
                let safeAreaInsets: @convention(block) (AnyObject) -> UIEdgeInsets = { _ in
                    return .zero
                }
                class_addMethod(viewSubclass, #selector(getter: UIView.safeAreaInsets), imp_implementationWithBlock(safeAreaInsets), method_getTypeEncoding(method))
            }
            
            objc_registerClassPair(viewSubclass)
            object_setClass(view, viewSubclass)
        }
    }
}
#endif
