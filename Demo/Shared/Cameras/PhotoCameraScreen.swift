//
//  PhotoCameraScreen.swift
//  Demo
//
//  Created by Daniel Saidi on 2020-11-27.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

#if os(iOS)
import SwiftUI
import SwiftUIKit

struct PhotoCameraScreen: View {
    
    @State private var index = 0
    @State private var photos = [Image]()
    
    @StateObject private var sheetContext = SheetContext()
    
    var body: some View {
        List {
            Section {
                Text("This camera can take photos. In this demo, the photos you take are added to a PageView.")
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
                Button(action: openCamera) {
                    Label("Open camera", image: .camera)
                }
            }
        }
        .navigationBarTitle("PhotoCamera")
        .sheet(sheetContext)
    }
}

private extension PhotoCameraScreen {
    
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
    
    func savePhoto(_ photo: ImageRepresentable) {
        let image = Image(image: photo)
        photos.append(image)
        dismissCamera()
    }
}

struct PhotoCameraScreen_Previews: PreviewProvider {
    
    static var previews: some View {
        NavigationView {
            PhotoCameraScreen()
        }
    }
}
#endif
