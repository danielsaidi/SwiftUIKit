//
//  CamerasScreen.swift
//  Demo
//
//  Created by Daniel Saidi on 2020-11-26.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

#if os(iOS)
import SwiftUI

struct CamerasScreen: View {
 
    var body: some View {
        MenuList("Cameras") {
            Section {
                MenuListText("SwiftUIKit has cameras that can be used to take photos and scan documents.")
            }
            
            Section(header: Text("Cameras")) {
                MenuListLink("Document Camera", .documentCamera, destination: DocumentCameraScreen())
                MenuListLink("Photo Camera", .camera, destination: PhotoCameraScreen())
            }
        }
    }
}

struct CamerasScreen_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CamerasScreen()
        }
    }
}
#endif
