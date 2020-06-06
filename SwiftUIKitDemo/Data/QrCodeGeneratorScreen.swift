//
//  QrCodeGeneratorScreen.swift
//  SwiftUIKitDemo
//
//  Created by Daniel Saidi on 2020-06-06.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI
import SwiftUIKit

struct QrCodeGeneratorScreen: View {
    
    private let generator = StandardQrCodeGenerator(scale: 30)
    
    @State private var uniqueId = 0
    @State private var qrCode = Image(uiImage: UIImage())
    
    var body: some View {
        List {
            Button("Generate new QR code", action: generateCode)
            qrCode.resizable().aspectRatio(1, contentMode: .fit)
        }
        .onAppear(perform: generateCode)
        .navigationBarTitle("QrCodeGenerator")
    }
}

private extension QrCodeGeneratorScreen {
    
    func generateCode() {
        uniqueId = Int.random(in: 0...1_000_000)
        qrCode = generator.generateQRCode(from: "\(uniqueId)") ?? qrCode
    }
}

struct QrCodeGeneratorScreen_Previews: PreviewProvider {
    static var previews: some View {
        QrCodeGeneratorScreen()
    }
}
