//
//  ConditionalViewScreen.swift
//  Demo
//
//  Created by Daniel Saidi on 2020-11-27.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI
import SwiftUIKit

struct ConditionalViewScreen: View {
    
    @State private var showView = true
    
    var body: some View {
        List {
            Section {
                ListTextItem("This view can display different views based on a bool expression.")
            }
            
            Section(header: Text("State")) {
                Toggle("Show view", isOn: $showView)
            }
            
            Section(header: Text("Result")) {
                ConditionalView(showView) {
                    Text("This view shows an empty view when the toggle if off (default behavior).")
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(20)
                }
                ConditionalView(
                    if: showView,
                    then: { Text("This view shows another text when the toggle if off (custom behavior).") },
                    else: { Text("Flip the toggle again to go back to the previous state.") })
                    .padding()
                    .background(Color.red)
                    .cornerRadius(20)
            }
        }.navigationBarTitle("ConditionalView")
    }
}

struct ConditionalViewScreen_Previews: PreviewProvider {
    
    static var previews: some View {
        ConditionalViewScreen()
    }
}
