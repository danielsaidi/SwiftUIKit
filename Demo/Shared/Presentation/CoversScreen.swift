//
//  CoversScreen.swift
//  Demo
//
//  Created by Daniel Saidi on 2020-11-26.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

#if os(iOS) || os(tvOS) || os(watchOS)
import SwiftUI
import SwiftUIKit

/**
 This screen has an additional context that helps verify the
 functionality when presenting both a sheet and a cover from
 the same root view.
 */
struct CoversScreen: View {
    
    @StateObject private var context = FullScreenCoverContext()
    @StateObject private var sheetContext = SheetContext()
    
    var body: some View {
        List {
            Section {
                ListText("SwiftUIKit has additional utils that make it easier to manage and present covers.")
            }
            
            Section(header: Text("Actions")) {
                ForEach(DemoPresentable.allCases) { item in
                    ListButtonLink(action: { presentCover(item) }) {
                        Label(item.listText(for: "cover"), image: item.listIcon)
                    }
                        
                }
            }
            Section(header: Text("Sheet (for testing purpose)")) {
                ListButtonLink(action: presentSheet) {
                    Label("Show an flag sheet", image: .sheet)
                }.sheet(context: sheetContext)
            }
        }
        .navigationBarTitle("Full Screen Covers")
        .fullScreenCover(context: context)
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
#endif
