//
//  DataScreen.swift
//  Demo
//
//  Created by Daniel Saidi on 2020-11-26.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI

struct DataScreen: View {
    var body: some View {
        DemoList("Data") {
            Section(header: Text("About")) {
                DemoListText("SwiftUIKit has some data utils, e.g. to create QR codes and (one) property wrappers.")
            }
            
            Section(header: Text("Utils")) {
                DemoListLink("QrCodeGenerator", .qrCode, QrCodeGeneratorScreen())
                DemoListLink("UserDefaultsPersisted", .data, UserDefaultsPersistedScreen())
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
