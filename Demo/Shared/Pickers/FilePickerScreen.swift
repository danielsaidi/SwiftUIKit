//
//  FilePickerScreen.swift
//  Demo
//
//  Created by Daniel Saidi on 2020-11-27.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

#if os(iOS)
import SwiftUI
import SwiftUIKit

struct FilePickerScreen: View {
    
    @StateObject private var sheetContext = SheetContext()
    
    var body: some View {
        List {
            Section {
                ListText("This picker can be used to pick a file from Files. In this demo, the files you picked can be shared with a ShareSheet.")
            }
            
            Section(header: Text("Actions")) {
                ListButton(action: openPicker) {
                    Label("Open picker", image: .file)
                }
            }
        }
        .navigationBarTitle("FilePicker")
        .sheet(sheetContext)
    }
}

private extension FilePickerScreen {
    
    var fileType: String { "public.png" }
    
    func createPicker() -> some View {
        FilePicker(
            documentTypes: [fileType],
            cancelAction: dismissPicker,
            resultAction: handleResult)
            .edgesIgnoringSafeArea(.all)
    }
    
    func dismissPicker() {
        sheetContext.dismiss()
    }
    
    func handleResult(_ result: FilePicker.PickerResult) {
        switch result {
        case .failure: dismissPicker()
        case .success(let urls):
            shareFiles(urls)
            dismissPicker()
        }
    }
    
    func openPicker() {
        sheetContext.present(createPicker())
    }
    
    func shareFiles(_ urls: [URL]) {
        dismissPicker()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            let sheet = ShareSheet(activityItems: urls)
            self.sheetContext.present(sheet)
        }
    }
}

struct FilePickerScreen_Previews: PreviewProvider {
    
    static var previews: some View {
        FilePickerScreen()
    }
}
#endif
