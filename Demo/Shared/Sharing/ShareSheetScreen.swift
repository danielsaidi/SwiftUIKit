//
//  ShareSheetScreen.swift
//  Demo
//
//  Created by Daniel Saidi on 2020-11-27.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

#if os(iOS)
import SwiftUI
import SwiftUIKit

struct ShareSheetScreen: View {
    
    @State private var urlString = "https://picsum.photos/200/300"
    
    @StateObject private var sheetContext = SheetContext()
    
    var body: some View {
        List {
            Section {
                Text("This sheet can be used to share urls, objects etc. In this demo, you can share a custom url.")
            }
            
            Section(header: Text("URL")) {
                TextField("Enter URL", text: $urlString)
            }
            
            Section(header: Text("Actions")) {
                Button(action: shareUrl) {
                    Label("Share the url", image: .sharing)
                }.enabled(hasUrl)
            }
        }
        .navigationBarTitle("ShareSheet")
        .sheet(sheetContext)
    }
}

private extension ShareSheetScreen {
    
    var hasUrl: Bool { url != nil }
    
    var url: URL? { URL(string: urlString) }
    
    func shareUrl() {
        guard let url = url else { return }
        let sheet = ShareSheet(activityItems: [url])
        sheetContext.present(sheet)
    }
}

struct ShareSheetScreen_Previews: PreviewProvider {
    
    static var previews: some View {
        ShareSheetScreen()
    }
}
#endif
