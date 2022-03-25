//
//  ScanCodeGeneratorScreen.swift
//  Demo
//
//  Created by Daniel Saidi on 2020-11-26.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI
import SwiftUIKit

struct ScanCodeGeneratorScreen: View {
    
    init(generator: ScanCodeGenerator = StandardScanCodeGenerator(scale: 100)) {
        self.generator = generator
    }
    
    private let generator: ScanCodeGenerator
    
    @State private var number = "123456"
    @State private var urlString = "https://picsum.photos/200/300"
    
    @StateObject private var sheetContext = SheetContext()
    
    var body: some View {
        List {
            Section {
                ListText("Enter a number and a url and tap the bottom buttons to generate scan codes.")
            }
            
            Section(header: Text("Number")) {
                TextField("Enter number", text: $number)
            }
            
            Section(header: Text("URL")) {
                TextField("Enter URL", text: $urlString)
            }
            
            Section(header: Text("Actions")) {
                ListButton(action: showBarode) {
                    Label("Show barcode for number", image: .barcode)
                }.enabled(hasNumber)
                 
                ListButton(action: showQrCode) {
                    Label("Show QR Code for url", image: .qrCode)
                }.enabled(hasUrl)
            }
        }
        .navigationBarTitle("ScanCodeGenerator")
        .sheet(sheetContext)
    }
}

private extension ScanCodeGeneratorScreen {
    
    var hasNumber: Bool { !number.trimmingCharacters(in: .whitespaces).isEmpty }
    
    var hasUrl: Bool { URL(string: urlString) != nil }
}

private extension ScanCodeGeneratorScreen {
    
    func showBarode() {
        guard let image = generator.generateCodeView(.barcode, from: number) else { return }
        sheetContext.present(
            NavigationView {
                VStack {
                    Spacer()
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    Text(number).font(.footnote)
                    Spacer()
                }
                
                .navigationTitle("Scan, ohoy!")
            }
        )
    }
    
    func showQrCode() {
        guard let image = generator.generateCodeView(.qr, from: urlString) else { return }
        sheetContext.present(
            NavigationView {
                VStack {
                    Spacer()
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    Text(urlString).font(.footnote)
                    Spacer()
                }
                
                .navigationTitle("Scan, ohoy!")
            }
        )
    }
}

struct ScanCodeGeneratorScreen_Previews: PreviewProvider {
    
    static var previews: some View {
        NavigationView {
            ScanCodeGeneratorScreen()
        }
    }
}
