//
//  KeyboardAvoidingScreen.swift
//  SwiftUIKitDemo
//
//  Created by Daniel Saidi on 2020-06-08.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI
import SwiftUIKit

struct KeyboardAvoidingScreen: View {
    
    @State private var text: String = ""
    
    var body: some View {
        List {
            Group {
                textField
                textField
                textField
                textField
                textField
                textField
                textField
                textField
                textField
                textField
            }.keyboardAvoiding()
        }.navigationBarTitle("KeyboardAvoiding")
    }
}

private extension KeyboardAvoidingScreen {
    
    var textField: some View {
        TextField("I will avoid the keyboard", text: $text)
    }
}

struct KeyboardAvoidingScreen_Previews: PreviewProvider {
    static var previews: some View {
        KeyboardAvoidingScreen()
    }
}
