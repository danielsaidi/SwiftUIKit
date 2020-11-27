//
//  ConditionalViewScreen.swift
//  Demo
//
//  Created by Daniel Saidi on 2020-11-27.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI

struct ConditionalViewScreen: View {
    
    @State private var showView = true
    
    var body: some View {
        DemoList("ConditionalView") {
            Section {
                Toggle("Show view", isOn: $showView)
            }
            
            ConditionalView(showView) {
                Section {
                    Text("This conditional view shows an empty view if the toggle is disabled")
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(20)
                }
            }
            
            Section {
                ConditionalView(
                    if: showView,
                    then: { Text("This conditional view shows another text if the toggle is disabled") },
                    else: { Text("Flip the toggle again to show the original text") })
                    .padding()
                    .background(Color.red)
                    .cornerRadius(20)
            }
        }
    }
}

struct ConditionalViewScreen_Previews: PreviewProvider {
    static var previews: some View {
        ConditionalViewScreen()
    }
}
