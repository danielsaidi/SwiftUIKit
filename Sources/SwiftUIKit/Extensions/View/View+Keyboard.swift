//
//  View+Keyboard.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-12-18.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

#if os(iOS)
import UIKit
import SwiftUI

public extension View {
    
    /**
     Hide the system keyboard.
     */
    func hideKeyboard() {
        let app = UIApplication.shared
        let sel = #selector(UIResponder.resignFirstResponder)
        app.sendAction(sel, to: nil, from: nil, for: nil)
    }
}
#endif
