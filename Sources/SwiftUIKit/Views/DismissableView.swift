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
    
    var dismiss: DismissAction { get }
}

public extension DismissableView {
    
    func dismiss() {
        dismiss.callAsFunction()
    }
}

#Preview {
    
    struct Preview: View {
        
        @State
        var isPresented = false
        
        var body: some View {
            Button("Present") {
                isPresented.toggle()
            }
            .sheet(isPresented: $isPresented) {
                PreviewSheet()
            }
        }
    }
    
    struct PreviewSheet: View {
        
        @Environment(\.dismiss)
        var dismiss
        
        var body: some View {
            Button("Dismiss") {
                dismiss()
            }
        }
    }
    
    return Preview()
}
