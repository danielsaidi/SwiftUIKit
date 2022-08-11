//
//  DismissableView.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-08-05.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI

/**
 This protocol simplifies dismissing `SwiftUI` views, e.g. a
 view that is presented as a modal sheet.
 
 Implement this protocol and add a presentation mode binding
 and you can dismiss a view with the `dismiss()` function.
 
 You can add a `presentationMode` property to a view as such:
 
 ```swift
 @Environment(\.presentationMode) var presentationMode
 ```

 In later versions of SwiftUI, use `@Environment(\.dismiss)`
 instead of this protocol and the presentation mode.
 */
public protocol DismissableView: View {
    
    var presentationMode: Binding<PresentationMode> { get }
}

public extension DismissableView {
    
    func dismiss() {
        presentationMode.wrappedValue.dismiss()
    }
}
