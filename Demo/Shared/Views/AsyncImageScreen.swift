//
//  AsyncImageScreen.swift
//  Demo
//
//  Created by Daniel Saidi on 2020-11-26.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI

struct AsyncImageScreen: View {
    
    @State private var urlString = "https://picsum.photos/200/300"
    
    @StateObject private var sheetContext = SheetContext()
    
    var body: some View {
        DemoList("AsyncImage") {
            Section {
                DemoListText("Enter the url to an image and tap the button to load the new image asynchronously.")
            }
            
            Section {
                TextField("Enter URL", text: $urlString)
            }
            
            Section {
                DemoListButton("Load image", .photo, loadImage)
                    .enabled(hasUrl)
            }
        }.sheet(context: sheetContext)
    }
}

private extension AsyncImageScreen {
    
    var hasUrl: Bool { url != nil }
    
    var url: URL? { URL(string: urlString) }
    
    func loadImage() {
        guard let url = url else { return }
        sheetContext.present(
            NavigationView {
                AsyncImage(url: url, placeholder: { CircularProgressView() })
                    .cornerRadius(10)
                    .padding()
                    .navigationTitle("Image, ohoy!")
            }
        )
    }
}

struct AsyncImageScreen_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AsyncImageScreen()
        }
    }
}
