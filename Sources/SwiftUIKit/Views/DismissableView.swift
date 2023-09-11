//
//  DismissableView.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-08-05.
//  Copyright © 2020-2023 Daniel Saidi. All rights reserved.
//

import SwiftUI

/**
 This protocol simplifies dismissing the view, e.g. a screen.

 Implement the protocol and add a `presentationMode` binding:

 ```swift
 @Environment(\.presentationMode)
 var presentationMode
 ```

 You can then dismiss the view with the `dismiss()` function.
 */
public protocol DismissableView: View {
    
    var presentationMode: Binding<PresentationMode> { get }
}

public extension DismissableView {
    
    func dismiss() {
        presentationMode.wrappedValue.dismiss()
    }
}
