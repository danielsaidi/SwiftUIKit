//
//  View+Keyboard.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-12-18.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

#if canImport(UIKit)
import UIKit
import SwiftUI

public extension View {
    
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif
