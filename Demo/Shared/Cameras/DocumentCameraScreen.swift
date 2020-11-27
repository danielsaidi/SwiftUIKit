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
        DemoList("DocumentCamera") {
            Section(header: Text("About")) {
                DemoListText("This camera can scan documents. In this demo, the scans are added to a PageView.")
            }
            
            if scans.count > 0 {
                Section(header: Text("Scans")) {
                    PageView(pages: scans.map { $0
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 300)
                    }, currentPageIndex: $index)
                }
            }
            
            Section(header: Text("Actions")) {
                DemoListButton("Open camera", .documentCamera, openCamera)
            }
        }.sheet(context: sheetContext)
    }
}

private extension DocumentCameraScreen {
    
    func createCamera() -> some View {
        DocumentCamera(
            cancelAction: dismissCamera,
            resultAction: handleResult)
            .edgesIgnoringSafeArea(.all)
    }
    
    func dismissCamera() {
        sheetContext.dismiss()
    }
    
    func handleResult(_ result: DocumentCamera.CameraResult) {
        switch result {
        case .failure: dismissCamera()
        case .success(let scans): saveImages(scans.images)
        }
    }
    
    func openCamera() {
        sheetContext.present(createCamera())
    }
    
    func saveImages(_ images: [Image]) {
        scans.append(contentsOf: images)
        dismissCamera()
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
