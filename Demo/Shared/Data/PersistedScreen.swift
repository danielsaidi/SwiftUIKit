//
//  PersistedScreen.swift
//  Demo
//
//  Created by Daniel Saidi on 2020-11-26.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI
import SwiftUIKit

struct PersistedScreen: View {
    
    @StateObject private var context = PersistentContext()
        
    var body: some View {
        List {
            Section {
                ListTextItem("Any text you type below is automatically persisted, using the @Persisted property wrapper. This also supports codable types.")
            }
            
            Section(header: Text("Text")) {
                TextField("Enter a text", text: $context.text)
            }
            
            Section(header: Text("Actions")) {
                ListButtonItem(action: reset) {
                    Label("Clear text", image: .clear)
                }
            }
        }.navigationBarTitle("Persisted")
    }
}

private extension PersistedScreen {
    
    func reset() {
        context.text = ""
    }
}

struct PersistedScreen_Previews: PreviewProvider {
    
    static var previews: some View {
        NavigationView {
            PersistedScreen()
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

    @Persisted(key: "com.danielsaidi.swiftuikit.demo.text", defaultValue: "")
    private var persistedText: String
}
