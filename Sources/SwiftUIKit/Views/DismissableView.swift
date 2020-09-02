//
//  DismissableView.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-08-05.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI

/**
 This protocol can be implemented by SwiftUI views that have
 a `Binding<PresentationMode>` property and provides a clean
 `dismiss` function that dismisses the wrapped binding value.
 
 You can add a `presentationMode` to your views like this:
 
 ```
 @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
 ```
 */
public protocol DismissableView: View {
    
    var presentationMode: Binding<PresentationMode> { get }
}

public extension DismissableView {
    
    func dismiss() {
        presentationMode.wrappedValue.dismiss()
    }
}
