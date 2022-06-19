//
//  ImagePickerScreen.swift
//  Demo
//
//  Created by Daniel Saidi on 2020-11-27.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

#if os(iOS)
import SwiftUI
import SwiftUIKit

struct ImagePickerScreen: View {
    
    private var sourceTypes: [UIImagePickerController.SourceType] = [.camera, .photoLibrary, .savedPhotosAlbum]
    
    @State private var index = 0
    @State private var images = [Image]()
    @State private var sourceType = UIImagePickerController.SourceType.camera
    
    @StateObject private var sheetContext = SheetContext()
    
    var body: some View {
        List {
            Section {
                ListText("This picker can pick image from the camera, photo library and saved photos. In this demo, the images you pick are added to a PageView.")
            }
            
            Section(header: Text("Source type")) {
                Picker("Source Type", selection: $sourceType) {
                    Text("Camera").tag(UIImagePickerController.SourceType.camera)
                    Text("Photo Library").tag(UIImagePickerController.SourceType.photoLibrary)
                    Text("Saved Photos").tag(UIImagePickerController.SourceType.savedPhotosAlbum)
                }.pickerStyle(SegmentedPickerStyle())
            }
            
            if images.count > 0 {
                Section(header: Text("Photos")) {
                    PageView(pages: images.map { $0
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 300)
                    }, currentPageIndex: $index)
                }
            }
            
            Section(header: Text("Actions")) {
                ListButton(action: openCamera) {
                    Label("Pick image", image: .photo)
                }
            }
        }
        .navigationBarTitle("ImagePicker")
        .sheet(sheetContext)
    }
}

private extension ImagePickerScreen {
    
    func createCamera() -> some View {
        ImagePicker(
            sourceType: sourceType,
            cancelAction: dismissCamera,
            resultAction: handleResult)
            .edgesIgnoringSafeArea(.all)
    }
    
    func dismissCamera() {
        sheetContext.dismiss()
    }
    
    func handleResult(_ result: ImagePicker.PickerResult) {
        switch result {
        case .failure: dismissCamera()
        case .success(let image): saveImage(image)
        }
    }
    
    func openCamera() {
        sheetContext.present(createCamera())
    }
    
    func saveImage(_ image: ImageRepresentable) {
        let image = Image(image: image)
        images.append(image)
        dismissCamera()
    }
}

struct ImagePickerScreen_Previews: PreviewProvider {
    
    static var previews: some View {
        ImagePickerScreen()
    }
}
#endif
