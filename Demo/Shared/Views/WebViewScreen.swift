//
//  WebViewScreen.swift
//  Demo
//
//  Created by Daniel Saidi on 2020-11-27.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

#if os(iOS)
import SwiftUI
import SwiftUIKit

struct WebViewScreen: View {
    
    @StateObject private var sheetContext = SheetContext()
 
    var body: some View {
        List {
            Section {
                ListText("This view can be used to present a URL in an embedded Safari browser.")
            }
            
            Section {
                ListButton(action: visitMyWebsite) {
                    Label("Visit my website", image: .web)
                }
                ListButton(action: visitApple) {
                    Label("Visit apple.com", image: .web)
                }
            }
        }
        .navigationBarTitle("WebView")
        .sheet(sheetContext)
    }
}

private extension WebViewScreen {
    
    func visitApple() {
        visit(url: URL(string: "https://apple.com"))
    }
    
    func visitMyWebsite() {
        visit(url: URL(string: "https://danielsaidi.com"))
    }
    
    func visit(url: URL?) {
        guard let url = url else { return }
        sheetContext.present(WebView(url: url))
    }
}

struct WebViewScreen_Previews: PreviewProvider {
    
    static var previews: some View {
        WebViewScreen()
    }
}
#endif
