//
//  DemoApp.swift
//  Shared
//
//  Created by Daniel Saidi on 2020-11-26.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI

@main
struct DemoApp: App {
    
    init() {
        DemoAppearance.apply()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
