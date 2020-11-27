//
//  CameraScreen.swift
//  Demo
//
//  Created by Daniel Saidi on 2020-11-26.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI

struct CameraScreen: View {
    var body: some View {
        DemoList("Camera") {
            Section(header: Text("About")) {
                DemoListText("SwiftUIKit has camera views that can be used to take photos and scan documents. For now, only the last is implemented.")
            }
            
            Section(header: Text("Utils")) {
                DemoListLink("Document Camera", .documentCamera, DocumentCameraScreen())
            }
        }
    }
}

struct CameraScreen_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CameraScreen()
        }
    }
}
