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
            Section(header: Text("About")) {
                DemoListText("This view can display different views based on a bool expression.")
            }
            
            Section(header: Text("State")) {
                Toggle("Show view", isOn: $showView)
            }
            
            Section(header: Text("Result")) {
                ConditionalView(showView) {
                    Text("This conditional view shows an empty view (default) if the toggle is disabled")
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(20)
                }
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
