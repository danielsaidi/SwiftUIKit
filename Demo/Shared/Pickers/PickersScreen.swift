//
//  PickersScreen.swift
//  Demo
//
//  Created by Daniel Saidi on 2020-11-26.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

#if os(iOS)
import SwiftUI

struct PickersScreen: View {
 
    var body: some View {
        MenuList("Pickers") {
            Section {
                MenuListText("SwiftUIKit hasadditional pickers for picking files and images. It also has a simple picker collection that is not yet in this demo.")
            }
            
            Section(header: Text("Pickers")) {
                MenuListLink("File Picker", .file, destination: FilePickerScreen())
                MenuListLink("Image Picker", .photo, destination: ImagePickerScreen())
            }
        }
    }
}

struct PickersScreen_Previews: PreviewProvider {
    static var previews: some View {
        PickersScreen()
    }
}
#endif
