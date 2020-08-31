//
//  KeyboardAvoidingContext.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-06-08.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//
//  Based on a solution by Bogdan Farca
//  https://stackoverflow.com/questions/56716311/how-to-show-complete-list-when-keyboard-is-showing-up-in-swiftui
//

#if os(iOS)
import Combine
import Foundation
import SwiftUI
import UIKit

public extension View {
    
    /**
     Apply a `KeyboardAvoiding` view modifier to the view.
     */
    func keyboardAvoiding() -> some View {
        self.modifier(KeyboardAvoiding())
    }
}

/**
 This view modifier can be used on any view, to make it move
 it up and down when the keyboard is presented and dismissed.
 
 You can also use the `keyboardAvoiding` view extension.
 */
public struct KeyboardAvoiding: ViewModifier {
    
    @State var currentHeight: CGFloat = 0
    
    public func body(content: Content) -> some View {
        content
            .padding(.bottom, currentHeight)
            .edgesIgnoringSafeArea(currentHeight == 0 ? Edge.Set() : .bottom)
            .onAppear(perform: subscribeToKeyboardEvents)
    }
    
    private let keyboardWillOpen = NotificationCenter.default
        .publisher(for: UIResponder.keyboardWillShowNotification)
        .map { $0.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as? CGRect ?? .zero }
        .map { $0.height }
    
    private let keyboardWillHide =  NotificationCenter.default
        .publisher(for: UIResponder.keyboardWillHideNotification)
        .map { _ in CGFloat.zero }
    
    private func subscribeToKeyboardEvents() {
        _ = Publishers.Merge(keyboardWillOpen, keyboardWillHide)
            .subscribe(on: RunLoop.main)
            .assign(to: \.currentHeight, on: self)
    }
}
#endif
