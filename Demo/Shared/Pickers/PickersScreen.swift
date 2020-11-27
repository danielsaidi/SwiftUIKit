//
//  PickersScreen.swift
//  Demo
//
//  Created by Daniel Saidi on 2020-11-26.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI

struct PickersScreen: View {
    var body: some View {
        DemoList("Pickers") {
            Section(header: Text("About")) {
                DemoListText("SwiftUIKit hasadditional pickers for picking files and images. It also has a simple picker collection that is not yet in this demo.")
            }
            
            Section(header: Text("Utils")) {
                DemoListLink("File Picker", .file, FilePickerScreen())
                DemoListLink("Image Picker", .photo, ImagePickerScreen())
            }
        }
    }
}

struct PickersScreen_Previews: PreviewProvider {
    static var previews: some View {
        PickersScreen()
    }
}
