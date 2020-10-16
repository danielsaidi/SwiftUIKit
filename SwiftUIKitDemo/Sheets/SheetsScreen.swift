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
    
    @StateObject private var context = SheetContext()
    
    var body: some View {
        ScrollView {
            VStack(spacing: listSpacing) {
                itemUsingSheetPresentable(.red)
                itemUsingSheetPresentable(.green)
                itemUsingView(.blue)
            }
        }
        .sheet(context: context)
        .navigationBarTitle("Sheets")
    }
}

private extension SheetsScreen {
    
    func itemUsingSheetPresentable(_ sheet: DemoSheet) -> some View {
        let title = "Show a \(sheet.title) sheet"
        let action = { self.context.present(sheet) }
        return DemoListItem(title: title, content: sheet.color, effect: { $0 })
            .onTapGesture(perform: action)
    }
    
    func itemUsingView(_ sheet: DemoSheet) -> some View {
        let title = "Show a \(sheet.title) sheet"
        let action = { self.context.present(sheet.sheet) }
        return DemoListItem(title: title, content: sheet.color, effect: { $0 })
            .onTapGesture(perform: action)
    }
}


struct SheetsScreenPreviews: PreviewProvider {
    static var previews: some View {
        SheetsScreen()
    }
}
