//
//  DataScreen.swift
//  SwiftUIKitDemo
//
//  Created by Daniel Saidi on 2020-06-06.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI

struct DataScreen: View {
    var body: some View {
        List {
            NavigationLink("QRCodeGenerator", destination: QrCodeGeneratorScreen())
            NavigationLink("UserDefaultsPersisted", destination: UserDefaultsPersistedScreen())
        }.navigationBarTitle("Data")
    }
}

struct DataScreen_Previews: PreviewProvider {
    static var previews: some View {
        DataScreen()
    }
}
