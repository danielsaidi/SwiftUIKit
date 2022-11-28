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
                Text("SwiftUIKit has additional pickers for picking files and images. It also has a ListPicker collection that is not yet in this demo.")
            }
            
            Section(header: Text("Pickers")) {
                NavigationLink(destination: FilePickerScreen()) {
                    Label("File Picker", image: .file)
                }
                NavigationLink(destination: ImagePickerScreen()) {
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
