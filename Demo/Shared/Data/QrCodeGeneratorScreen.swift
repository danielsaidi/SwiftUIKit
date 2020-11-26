//
//  QrCodeGeneratorScreen.swift
//  Demo
//
//  Created by Daniel Saidi on 2020-11-26.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI

struct QrCodeGeneratorScreen: View {
    
    init(generator: QrCodeGenerator = StandardQrCodeGenerator(scale: 100)) {
        self.generator = generator
    }
    
    private let generator: QrCodeGenerator
    
    @State private var urlString = "https://picsum.photos/200/300"
    
    @StateObject private var sheetContext = SheetContext()
    
    var body: some View {
        List {
            Section {
                DemoListText("Enter a url and tap the button to show a code that you can scan with your phone.")
            }
            
            Section {
                TextField("Enter URL", text: $urlString)
            }
            
            Section {
                DemoListButton("Show QR Code", .qrCode, showCode)
                    .enabled(hasUrl)
            }
        }
        .sheet(context: sheetContext)
        .listStyle(GroupedListStyle())
        .navigationTitle("QrCodeGenerator")
    }
}

private extension QrCodeGeneratorScreen {
    
    var hasUrl: Bool {
        !urlString.trimmingCharacters(in: .whitespaces).isEmpty
    }
}

private extension QrCodeGeneratorScreen {
    
    func showCode() {
        guard let image = generator.generateQRCode(from: urlString) else { return }
        sheetContext.present(
            NavigationView {
                VStack {
                    Text("Scan this code with a mobile device to open the embedded url.")
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    Spacer()
                }.navigationBarTitle("Congratulations!")
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
