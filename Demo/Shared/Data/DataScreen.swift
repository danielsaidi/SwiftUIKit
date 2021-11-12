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
        List {
            Section {
                ListText("SwiftUIKit has some data utils, e.g. to create QR codes and (one) property wrappers.")
            }
            
            Section(header: Text("Utils")) {
                ListNavigationLink(destination: ScanCodeGeneratorScreen()) {
                    Label("Scan Code Generator", image: .qrCode)
                }
                
                ListNavigationLink(destination: PersistedScreen()) {
                    Label("Persisted", image: .data)
                }
            }
        }.navigationBarTitle("Data")
    }
}

struct DataScreen_Previews: PreviewProvider {
    
    static var previews: some View {
        NavigationView {
            DataScreen()
        }
    }
}
