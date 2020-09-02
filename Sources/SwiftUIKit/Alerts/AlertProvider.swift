//
//  AlertProvider.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-06-07.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI

@available(*, deprecated, renamed: "AlertProvider")
public typealias AlertPresentable = AlertProvider

/**
 This protocol can be implemented by anything (e.g. a struct,
 enum or class) that can provide a SwiftUI `Alert`.
 */
public protocol AlertProvider {
    
    var alert: Alert { get }
}
