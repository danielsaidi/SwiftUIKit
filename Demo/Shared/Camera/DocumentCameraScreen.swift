//
//  DocumentCameraScreen.swift
//  Demo
//
//  Created by Daniel Saidi on 2020-11-27.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI
import VisionKit

struct DocumentCameraScreen: View {
    
    @State private var index = 0
    @State private var scans = [Image]()
    
    @StateObject private var sheetContext = SheetContext()
    
    var body: some View {
        DemoList("Document Camera") {
            Section(header: Text("About")) {
                DemoListText("This camera can be used to scan documents and take one or multiple photos.")
            }
            
            if scans.count > 0 {
                Section(header: Text("Photos")) {
                    MultiPageView(pages: scans.map { $0
                        .resizable()
                        .frame(height: 150)
                        .aspectRatio(contentMode: .fit)
                    }, currentPageIndex: $index)
                }
            }
            
            Section(header: Text("Actions")) {
                DemoListButton("Open camera", .camera, openCamera)
            }
        }.sheet(context: sheetContext)
    }
}

private extension DocumentCameraScreen{
    
    func createCamera() -> some View {
        DocumentCamera(delegate: DocumentCamera.Delegate(
            didCancel: { self.sheetContext.dismiss() },
            didFail: { _ in self.sheetContext.dismiss() },
            didFinish: { self.saveScans($0.images) }
        )).edgesIgnoringSafeArea(.all)
    }
    
    func openCamera() {
        sheetContext.present(createCamera())
    }
    
    func saveScans(_ scans: [Image]) {
        self.scans = scans
    }
}

struct DocumentCameraScreen_Previews: PreviewProvider {
    static var previews: some View {
        DocumentCameraScreen()
    }
}

private extension VNDocumentCameraScan {
    
    /**
     Get all images from the scan.
     */
    var images: [Image] {
        (0..<pageCount)
            .compactMap { imageOfPage(at: $0) }
            .map { Image(uiImage: $0) }
    }
}
