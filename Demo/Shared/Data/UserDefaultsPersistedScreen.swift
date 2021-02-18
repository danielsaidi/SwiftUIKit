//
//  UserDefaultsPersistedScreen.swift
//  Demo
//
//  Created by Daniel Saidi on 2020-11-26.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI

struct UserDefaultsPersistedScreen: View {
    
    init(generator: QrCodeGenerator = StandardQrCodeGenerator(scale: 100)) {
        self.generator = generator
    }
    
    private let generator: QrCodeGenerator
    
    @StateObject private var context = PersistentContext()
        
    var body: some View {
        MenuList("UserDefaultsPersisted") {
            Section {
                MenuListText("Any text you type below is automatically persisted in UserDefaults, using the @UserDefaultsPersisted property wrapper.")
            }
            
            Section(header: Text("Text")) {
                TextField("Enter a text", text: $context.text)
            }
            
            Section(header: Text("Actions")) {
                MenuListButton("Clear text", .clear) { context.text = "" }
            }
        }
    }
}

struct UserDefaultsPersistedScreen_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            UserDefaultsPersistedScreen()
        }
    }
}

private class PersistentContext: ObservableObject {
    
    init() {
        text = persistedText
    }
    
    @Published var text: String = "" {
        didSet { persistedText = text }
    }

    @UserDefaultsPersisted(key: "com.danielsaidi.swiftuikit.demo.text", defaultValue: "") private var persistedText: String
}
