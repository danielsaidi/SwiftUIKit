//
//  SharingScreen.swift
//  Demo
//
//  Created by Daniel Saidi on 2020-11-26.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

#if os(iOS)
import SwiftUI
import SwiftUIKit

struct SharingScreen: View {
 
    var body: some View {
        List {
            Section {
                ListText("SwiftUIKit has utils that can be used to share data in SwiftUI.")
            }
            
            Section(header: Text("Utils")) {
                ListNavigationLink(destination: ShareSheetScreen()) {
                    Label("Share Sheet", image: .sharing)
                }
            }
        }.navigationBarTitle("Sharing")
    }
}

struct SharingScreen_Previews: PreviewProvider {
    
    static var previews: some View {
        SharingScreen()
    }
}
#endif
