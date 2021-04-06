//
//  QrCodeGeneratorScreen.swift
//  Demo
//
//  Created by Daniel Saidi on 2020-11-26.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI
import SwiftUIKit

struct QrCodeGeneratorScreen: View {
    
    init(generator: QrCodeGenerator = StandardQrCodeGenerator(scale: 100)) {
        self.generator = generator
    }
    
    private let generator: QrCodeGenerator
    
    @State private var urlString = "https://picsum.photos/200/300"
    
    @StateObject private var sheetContext = SheetContext()
    
    var body: some View {
        MenuList("QrCodeGenerator") {
            Section {
                MenuListText("Enter a url and tap the button to show a code that you can scan with your phone.")
            }
            
            Section(header: Text("URL")) {
                TextField("Enter URL", text: $urlString)
            }
            
            Section(header: Text("Actions")) {
                MenuListItem(icon: .qrCode, title: "Show QR Code")
                    .button(action: showCode)
                    .enabled(hasUrl)
            }
        }
        .sheet(context: sheetContext)
    }
}

private extension QrCodeGeneratorScreen {
    
    var hasUrl: Bool { URL(string: urlString) != nil }
}

private extension QrCodeGeneratorScreen {
    
    func showCode() {
        guard let image = generator.generateQRCode(from: urlString) else { return }
        sheetContext.present(
            NavigationView {
                VStack {
                    Spacer()
                    Text("Scan this code with a mobile device to open the embedded url.")
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    Spacer()
                }
                
                .navigationTitle("Scan, ohoy!")
            }
        )
    }
}

struct QrCodeGeneratorScreen_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            QrCodeGeneratorScreen()
        }
    }
}
