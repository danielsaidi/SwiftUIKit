//
//  PhotoCameraScreen.swift
//  Demo
//
//  Created by Daniel Saidi on 2020-11-27.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI
import VisionKit

struct PhotoCameraScreen: View {
    
    @State private var index = 0
    @State private var photos = [Image]()
    
    @StateObject private var sheetContext = SheetContext()
    
    var body: some View {
        DemoList("PhotoCamera") {
            Section(header: Text("About")) {
                DemoListText("This camera can take photos. In this demo, the photos you take are added to a PageView.")
            }
            
            if photos.count > 0 {
                Section(header: Text("Photos")) {
                    PageView(pages: photos.map { $0
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 300)
                    }, currentPageIndex: $index)
                }
            }
            
            Section(header: Text("Actions")) {
                DemoListButton("Open camera", .camera, openCamera)
            }
        }.sheet(context: sheetContext)
    }
}

private extension PhotoCameraScreen{
    
    func createCamera() -> some View {
        PhotoCamera(
            cancelAction: dismissCamera,
            resultAction: handleResult)
            .edgesIgnoringSafeArea(.all)
    }
    
    func dismissCamera() {
        sheetContext.dismiss()
    }
    
    func handleResult(_ result: PhotoCamera.CameraResult) {
        switch result {
        case .failure: dismissCamera()
        case .success(let photo): savePhoto(photo)
        }
    }
    
    func openCamera() {
        sheetContext.present(createCamera())
    }
    
    func savePhoto(_ photo: Image) {
        photos.append(photo)
        dismissCamera()
    }
}

struct PhotoCameraScreen_Previews: PreviewProvider {
    static var previews: some View {
        PhotoCameraScreen()
    }
}
