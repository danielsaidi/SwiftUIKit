//
//  SheetPresentable.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-06-06.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI

/**
 This protocol can be implemented by anything (e.g. a custom
 enum, struct or a class) that can provide views that should
 be presented as modal sheets.
 */
public protocol SheetPresentable {
    
    var sheet: AnyView { get }
}
