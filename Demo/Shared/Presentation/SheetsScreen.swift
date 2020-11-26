//
//  SheetsScreen.swift
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
struct SheetsScreen: View {
    
    @StateObject private var context = SheetContext()
    @StateObject private var coverContext = FullScreenCoverContext()
    
    var body: some View {
        DemoList("Sheets") {
            ForEach(DemoPresentable.allCases) { item in
                DemoListButton(item.listText(for: "sheet"), item.listIcon) {
                    present(item)
                }
            }
            DemoListButton("Show an emoji cover (test)", .cover, showCover)
                .fullScreenCover(context: coverContext)
        }.sheet(context: context)
    }
}

private extension SheetsScreen {
    
    func present(_ presentable: DemoPresentable) {
        context.present(presentable)
    }
    
    func showCover() {
        coverContext.present(
            NavigationView {
                DemoPresentable.flag
                    .cover
                    .navigationBarTitle("", displayMode: .inline)
                    .navigationBarItems(trailing: Button("Close", action: { coverContext.dismiss() }))
            }
        )
    }
}

struct SheetsScreen_Previews: PreviewProvider {
    static var previews: some View {
        SheetsScreen()
    }
}
