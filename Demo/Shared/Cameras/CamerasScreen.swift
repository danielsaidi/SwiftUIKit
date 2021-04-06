//
//  CamerasScreen.swift
//  Demo
//
//  Created by Daniel Saidi on 2020-11-26.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

#if os(iOS)
import SwiftUI
import SwiftUIKit

struct CamerasScreen: View {
 
    var body: some View {
        MenuList("Cameras") {
            Section {
                MenuListText("SwiftUIKit has cameras that can be used to take photos and scan documents.")
            }
            
            Section(header: Text("Cameras")) {
                MenuListItem(icon: .documentCamera, title: "Document Camera")
                    .navigationLink(to: DocumentCameraScreen())
                MenuListItem(icon: .camera, title: "Photo Camera")
                    .navigationLink(to: PhotoCameraScreen())
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
