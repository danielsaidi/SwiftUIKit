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
        List {
            Section {
                ListText("SwiftUIKit has cameras that can be used to take photos and scan documents.")
            }
            
            Section(header: Text("Cameras")) {
                ListNavigationLink(destination: DocumentCameraScreen()) {
                    Label("Document Camera", image: .documentCamera)
                }
                
                ListNavigationLink(destination: PhotoCameraScreen()) {
                    Label("Photo Camera", image: .camera)
                }
                
            }
        }.navigationBarTitle("Cameras")
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
