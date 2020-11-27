//
//  CircularProgressViewScreen.swift
//  Demo
//
//  Created by Daniel Saidi on 2020-11-27.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI

struct CircularProgressViewScreen: View {
    
    @State private var isLoading = true
    
    var body: some View {
        DemoList("CircularProgressView") {
            Section {
                Toggle("Is loading", isOn: $isLoading)
            }
            
            Section {
                ConditionalView(isLoading) {
                    HStack {
                        Spacer()
                        CircularProgressView()
                        Spacer()
                    }
                }
            }
        }
    }
}

struct CircularProgressViewScreen_Previews: PreviewProvider {
    static var previews: some View {
        CircularProgressViewScreen()
    }
}
