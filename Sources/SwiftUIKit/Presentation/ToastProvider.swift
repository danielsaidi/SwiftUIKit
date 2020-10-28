//
//  ToastProvider.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-09-03.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI

/**
 This protocol can be implemented by anything (e.g. a struct,
 enum or class) that can provide a `toast` view, that can be
 presented as a toast overlay.
 */
public protocol ToastProvider {
    
    var toast: AnyView { get }
}
