//
//  DismissableView.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-08-05.
//  Copyright © 2020-2024 Daniel Saidi. All rights reserved.
//

import SwiftUI

@available(*, deprecated, message: "From now on, just use the dismiss environment value.")
public protocol DismissableView: View {
    
    var dismiss: DismissAction { get }
}

@available(*, deprecated, message: "From now on, just use the dismiss environment value.")
public extension DismissableView {
    
    func dismiss() {
        dismiss.callAsFunction()
    }
}
