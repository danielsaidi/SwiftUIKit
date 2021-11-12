//
//  PickersScreen.swift
//  Demo
//
//  Created by Daniel Saidi on 2020-11-26.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

#if os(iOS)
import SwiftUI
import SwiftUIKit

struct PickersScreen: View {
 
    var body: some View {
        List {
            Section {
                ListText("SwiftUIKit hasadditional pickers for picking files and images. It also has a simple picker collection that is not yet in this demo.")
            }
            
            Section(header: Text("Pickers")) {
                ListNavigationLink(destination: FilePickerScreen()) {
                    Label("File Picker", image: .file)
                }
                ListNavigationLink(destination: ImagePickerScreen()) {
                    Label("Image Picker", image: .photo)
                }
            }
        }.navigationBarTitle("Pickers")
    }
}

struct PickersScreen_Previews: PreviewProvider {
    
    static var previews: some View {
        PickersScreen()
    }
}
#endif
