//
//  DataScreen.swift
//  Demo
//
//  Created by Daniel Saidi on 2020-11-26.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI
import SwiftUIKit

struct DataScreen: View {
 
    var body: some View {
        MenuList("Data") {
            Section {
                MenuListText("SwiftUIKit has some data utils, e.g. to create QR codes and (one) property wrappers.")
            }
            
            Section(header: Text("Utils")) {
                MenuListItem(icon: .qrCode, title: "Scan Code Generator")
                    .navigationLink(to: ScanCodeGeneratorScreen())
                MenuListItem(icon: .data, title: "UserDefaults Persisted")
                    .navigationLink(to: UserDefaultsPersistedScreen())
            }
        }
    }
}

struct DataScreen_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DataScreen()
        }
    }
}
