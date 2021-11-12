//
//  DismissableViewScreen.swift
//  Demo
//
//  Created by Daniel Saidi on 2020-11-27.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI
import SwiftUIKit

struct DismissableViewScreen: View, DismissableView {
    
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        List {
            Section {
                ListTextItem("This protocol makes it easy to dismiss views.")
            }
            
            Section {
                ListButtonItem(action: dismiss) {
                    Label("Dismiss this screen", image: .dismiss)
                }
            }
        }.navigationBarTitle("DismissableView")
    }
}

struct DismissableViewScreen_Previews: PreviewProvider {
    
    static var previews: some View {
        DismissableViewScreen()
    }
}
