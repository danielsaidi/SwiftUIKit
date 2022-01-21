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
 enum etc.) that can provide a toast view.
 */
@available(*, deprecated, message: "Toast is deprecated. Use the new https://github.com/danielsaidi/SystemNotification library instead.")
public protocol ToastProvider {
    
    var toast: AnyView { get }
}
