//
//  CircularProgressViewScreen.swift
//  Demo
//
//  Created by Daniel Saidi on 2020-11-27.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

#if os(iOS) || os(tvOS) || os(watchOS)
import SwiftUI
import SwiftUIKit

struct CircularProgressViewScreen: View {
    
    @State private var isLoading = true
    
    var body: some View {
        List {
            Section {
                ListText("This view displays a circular progress spinner.")
            }
            
            Section(header: Text("State")) {
                Toggle("Is loading", isOn: $isLoading)
            }
            
            Section(header: Text("Result")) {
                ConditionalView(isLoading) {
                    HStack {
                        Spacer()
                        CircularProgressView()
                        Spacer()
                    }
                }
            }
        }.navigationBarTitle("CircularProgressView")
    }
}

struct CircularProgressViewScreen_Previews: PreviewProvider {
    
    static var previews: some View {
        CircularProgressViewScreen()
    }
}
#endif
