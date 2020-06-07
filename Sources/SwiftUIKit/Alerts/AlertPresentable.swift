//
//  AlertPresentable.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-06-07.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI

/**
 This protocol can be implemented by anything (e.g. a custom
 enum, struct or a class) that can provide an alert.
 */
public protocol AlertPresentable {
    
    var alert: Alert { get }
}
