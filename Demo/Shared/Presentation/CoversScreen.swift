//
//  CoversScreen.swift
//  Demo
//
//  Created by Daniel Saidi on 2020-11-26.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI

/**
 This screen has an additional context that helps verify the
 functionality when presenting both a sheet and a cover from
 the same root view.
 */
struct CoversScreen: View {
    
    @StateObject private var context = FullScreenCoverContext()
    @StateObject private var sheetContext = SheetContext()
    
    var body: some View {
        DemoList("Full Screen Covers") {
            ForEach(DemoPresentable.allCases) { item in
                DemoListButton(item.listText(for: "full screen cover"), item.listIcon) {
                    present(item)
                }
            }
            DemoListButton("Show an emoji sheet (test)", .sheet, showSheet)
                .sheet(context: sheetContext)
        }.fullScreenCover(context: context)
    }
}

private extension CoversScreen {
    
    func present(_ presentable: DemoPresentable) {
        context.present(
            NavigationView {
                presentable
                    .cover
                    .navigationBarTitle("", displayMode: .inline)
                    .navigationBarItems(trailing: Button("Close", action: { context.dismiss() }))
            }
        )
    }
    
    func showSheet() {
        sheetContext.present(DemoPresentable.flag)
    }
}

struct CoversScreen_Previews: PreviewProvider {
    static var previews: some View {
        CoversScreen()
    }
}
