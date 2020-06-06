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
    
    @ObservedObject private var context = SheetContext()
    
    var body: some View {
        ScrollView {
            VStack(spacing: listSpacing) {
                item(.red)
                item(.green)
                item(.blue)
            }
        }
        .navigationBarTitle("Sheets")
        .sheet(isPresented: $context.isActive, content: context.view)
    }
}

private extension SheetsScreen {
    
    func item(_ sheet: DemoSheet) -> some View {
        let title = "Show a \(sheet.title) sheet"
        let action = { self.context.present(sheet) }
        return DemoListItem(title: title, content: sheet.color, effect: { $0 })
            .onTapGesture(perform: action)
    }
}


struct SheetsScreenPreviews: PreviewProvider {
    static var previews: some View {
        SheetsScreen()
    }
}
