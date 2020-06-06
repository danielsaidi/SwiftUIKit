//
//  SheetPresentable.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-06-06.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI

/**
 This protocol can be implemented by any type (e.g. an enum)
 that can provide a view to be displayed in a modal sheet.
 */
public protocol SheetPresentable {
    
    var sheetView: AnyView { get }
}
