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
            Section(header: Text("About")) {
                DemoListText("SwiftUIKit has additional utils that make it easier to manage and present covers.")
            }
            
            Section(header: Text("Alerts")) {
                ForEach(DemoPresentable.allCases) { item in
                    DemoListButton(item.listText(for: "cover"), item.listIcon) {
                        presentCover(item)
                    }
                }
            }
            Section(header: Text("Sheet (for testing purpose)")) {
                DemoListButton("Show an flag sheet", .sheet, presentSheet)
                    .sheet(context: sheetContext)
            }
        }.fullScreenCover(context: context)
    }
}

private extension CoversScreen {
    
    var closeButton: some View {
        Button("Close", action: { context.dismiss() })
    }
    
    func presentCover(_ presentable: DemoPresentable) {
        context.present(
            NavigationView {
                view(for: presentable)
                    .navigationBarItems(trailing: closeButton)
            }
        )
    }
    
    func presentSheet() {
        sheetContext.present(
            NavigationView {
                view(for: .flag)
            }
        )
    }
    
    func view(for presentable: DemoPresentable, addClose: Bool = false) -> some View {
        presentable.cover
            .navigationTitle("Hello, you!")
            .navigationBarTitleDisplayMode(.inline)
        
    }
}

struct CoversScreen_Previews: PreviewProvider {
    static var previews: some View {
        CoversScreen()
    }
}
