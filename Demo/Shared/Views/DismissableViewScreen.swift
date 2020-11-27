//
//  DismissableViewScreen.swift
//  Demo
//
//  Created by Daniel Saidi on 2020-11-27.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI

struct DismissableViewScreen: View, DismissableView {
    
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        DemoList("DismissableView") {
            Section(header: Text("About")) {
                DemoListText("This protocol makes it easy to dismiss views.")
            }
            
            Section(header: Text("Actions")) {
                DemoListButton("Dismiss this screen", .dismiss, dismiss)
            }
        }
    }
}

struct DismissableViewScreen_Previews: PreviewProvider {
    static var previews: some View {
        DismissableViewScreen()
    }
}
