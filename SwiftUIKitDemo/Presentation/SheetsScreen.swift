//
//  SheetsScreen swift
//  SwiftUIKitDemo
//
//  Created by Daniel Saidi on 2020-06-06.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI
import SwiftUIKit

struct SheetsScreen: View, DemoList {
    
    @StateObject private var coverContext = FullScreenCoverContext()
    @StateObject private var sheetContext = SheetContext()
    
    var body: some View {
        ScrollView {
            VStack(spacing: listSpacing) {
                itemUsingView(.red)
                itemUsingView(.green)
                itemUsingProvider(.blue)
            }
            .sheet(context: sheetContext)
            EmptyView().fullScreenCover(context: coverContext)
        }
        .navigationBarTitle("Sheets")
    }
}

private extension SheetsScreen {
    
    func itemUsingProvider(_ sheet: DemoSheet) -> some View {
        let title = "Show a \(sheet.title) sheet"
        let action = { self.sheetContext.present(sheet) }
        return DemoListItem(title: title, content: sheet.color, effect: { $0 })
            .onTapGesture(perform: action)
    }
    
    func itemUsingView(_ sheet: DemoSheet) -> some View {
        let title = "Show a \(sheet.title) sheet"
        let action = { self.sheetContext.present(sheet.sheet) }
        return DemoListItem(title: title, content: sheet.color, effect: { $0 })
            .onTapGesture(perform: action)
    }
}


struct SheetsScreenPreviews: PreviewProvider {
    static var previews: some View {
        SheetsScreen()
    }
}
