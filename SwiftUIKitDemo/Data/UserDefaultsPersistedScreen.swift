//
//  UserDefaultsPersistedScreen.swift
//  SwiftUIKitDemo
//
//  Created by Daniel Saidi on 2020-06-06.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI
import SwiftUIKit

private class Context: ObservableObject {
    
    init() {
        observedValue = randomNumber
    }
    
    @UserDefaultsPersisted(key: "UserDefaultsPersistedDemo", defaultValue: 0)
    var randomNumber: Int {
        didSet { observedValue = randomNumber }
    }
    
    @Published private(set) var observedValue: Int = 0
    
    func generateNewRandomNumber() {
        randomNumber = Int.random(in: 0...1_000_000)
    }
}

struct UserDefaultsPersistedScreen: View {
    
    @ObservedObject private var context = Context()
    
    var body: some View {
        List {
            Button(action: generateNewRandomNumber) {
                VStack(alignment: .leading) {
                    Text("Generate new, random number")
                    Text("This value will be persisted in user defaults").font(.footnote)
                }
            }
            Text("\(context.randomNumber)").font(.title)
        }
        .navigationBarTitle("UserDefaultsPersisted")
    }
}

private extension UserDefaultsPersistedScreen {
    
    func generateNewRandomNumber() {
        context.generateNewRandomNumber()
    }
}

struct UserDefaultsPersistedScreen_Previews: PreviewProvider {
    static var previews: some View {
        UserDefaultsPersistedScreen()
    }
}
