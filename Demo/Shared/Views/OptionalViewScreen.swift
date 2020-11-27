//
//  OptionalViewScreen.swift
//  Demo
//
//  Created by Daniel Saidi on 2020-11-27.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI

struct OptionalViewScreen: View {
    
    @State private var hasValue = true
    
    var string: String? { hasValue ? "This view is shown because the toggle sets an optional string." : nil }
    
    var body: some View {
        DemoList("OptionalView") {
            Section(header: Text("About")) {
                DemoListText("This view can display different views based on if an optional value is set or not.")
            }
            
            Section(header: Text("State")) {
                Toggle("Has value", isOn: $hasValue)
            }
            
            Section(header: Text("Result")) {
                OptionalView(string) { string in
                    Text(string + " This view shows an empty view when the toggle if off (default behavior).")
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(20)
                }
                OptionalView(
                    if: string,
                    then: { string in Text(string + " This view shows another view when the toggle if off (custom behavior).") },
                    else: { Text("Flip the toggle again to go back to the previous state.") })
                    .padding()
                    .background(Color.red)
                    .cornerRadius(20)
            }
        }
    }
}

struct OptionalViewScreen_Previews: PreviewProvider {
    static var previews: some View {
        OptionalViewScreen()
    }
}
