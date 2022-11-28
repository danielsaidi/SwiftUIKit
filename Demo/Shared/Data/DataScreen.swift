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
                Text("SwiftUIKit has some data utils, e.g. to create QR codes and (one) property wrappers.")
            }
            
            Section(header: Text("Utils")) {
                NavigationLink(destination: ScanCodeGeneratorScreen()) {
                    Label("Scan Code Generator", image: .qrCode)
                }
                
                NavigationLink(destination: PersistedScreen()) {
                    Label("Persisted", image: .data)
                }
            }
        }.navigationTitle("Data")
    }
}

struct DataScreen_Previews: PreviewProvider {
    
    static var previews: some View {
        NavigationView {
            DataScreen()
        }
    }
}
