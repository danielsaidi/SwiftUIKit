//
//  FullScreenCoversScreen.swift
//  SwiftUIKitDemo
//
//  Created by Daniel Saidi on 2020-10-28.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI
import SwiftUIKit

struct FullScreenCoversScreen: View, DemoList {
    
    @StateObject private var coverContext = FullScreenCoverContext()
    @StateObject private var sheetContext = SheetContext()
    
    var body: some View {
        ScrollView {
            VStack(spacing: listSpacing) {
                itemUsingView(.red)
                itemUsingView(.green)
                itemUsingProvider(.blue)
            }
            .fullScreenCover(context: coverContext)
            EmptyView().sheet(context: sheetContext)
        }
        .navigationBarTitle("Full Screen Covers")
    }
}

private extension FullScreenCoversScreen {
    
    func itemUsingProvider(_ cover: DemoCover) -> some View {
        let title = "Show a \(cover.title) cover"
        let action = { self.coverContext.present(cover) }
        return DemoListItem(title: title, content: cover.color, effect: { $0 })
            .onTapGesture(perform: action)
    }
    
    func itemUsingView(_ cover: DemoCover) -> some View {
        let title = "Show a \(cover.title) cover"
        let action = { self.coverContext.present(cover.cover) }
        return DemoListItem(title: title, content: cover.color, effect: { $0 })
            .onTapGesture(perform: action)
    }
}


struct FullScreenCoversScreenPreviews: PreviewProvider {
    static var previews: some View {
        FullScreenCoversScreen()
    }
}

