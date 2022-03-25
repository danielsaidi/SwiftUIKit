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
    
    @State private var text = "https://picsum.photos/200/300"
    
    @StateObject private var sheetContext = SheetContext()
    
    var body: some View {
        List {
            Section {
                ListText("Enter a text and tap the bottom buttons to generate various type of scan codes.")
            }
            
            Section(header: Text("Text")) {
                TextField("Enter text", text: $text)
            }
            
            Section(header: Text("Show scan code")) {
                ForEach(ScanCodeType.allCases) { type in
                    ListButton(action: { showScanCode(type) }) {
                        Label(type.name, image: type.icon)
                    }.enabled(hasText)
                }
            }
        }
        .navigationTitle("ScanCodeGenerator")
        .sheet(sheetContext)
    }
}

private extension ScanCodeGeneratorScreen {
    
    var hasText: Bool {
        !text.trimmingCharacters(in: .whitespaces).isEmpty
    }
}

private extension ScanCodeType {
    
    var icon: Image {
        switch self {
        case .aztek: return .qrCode
        case .code128: return .barcode
        case .pdf417: return .barcode
        case .qr: return .qrCode
        }
    }
}

private extension ScanCodeGeneratorScreen {
    
    func showScanCode(_ type: ScanCodeType) {
        guard let image = generator.generateCodeView(type, from: text) else { return }
        sheetContext.present(
            NavigationView {
                VStack {
                    Spacer()
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    Text(text).font(.footnote)
                    Spacer()
                }.navigationTitle("Scan, ohoy!")
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
