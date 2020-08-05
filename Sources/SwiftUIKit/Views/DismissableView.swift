//
//  DismissableView.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-08-05.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI

public protocol DismissableView: View {
    
    var presentationMode: Binding<PresentationMode> { get }
}

public extension DismissableView {
    
    func dismiss() {
        presentationMode.wrappedValue.dismiss()
    }
}
