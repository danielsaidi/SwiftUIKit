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
            Section(header: Text("About")) {
                DemoListText("SwiftUIKit has additional utils that make it easier to manage and present sheets.")
            }
            
            Section(header: Text("Alerts")) {
                ForEach(DemoPresentable.allCases) { item in
                    DemoListButton(item.listText(for: "sheet"), item.listIcon) {
                        presentSheet(item)
                    }
                }
            }
            #if os(iOS) || os(tvOS) || os(watchOS)
            Section(header: Text("Cover (for testing purpose)")) {
                DemoListButton("Show an flag cover", .cover, presentCover)
                    .fullScreenCover(context: coverContext)
            }
            #endif
        }.sheet(context: context)
    }
}

private extension SheetsScreen {
    
    var closeButton: some View {
        Button("Close", action: { coverContext.dismiss() })
    }
    
    func presentCover() {
        #if os(iOS) || os(tvOS) || os(watchOS)
        coverContext.present(
            NavigationView {
                view(for: .flag)
                    .navigationBarItems(trailing: closeButton)
            }
        )
        #endif
    }
    
    func presentSheet(_ presentable: DemoPresentable) {
        context.present(
            NavigationView {
                view(for: presentable)
            }
        )
    }
    
    func view(for presentable: DemoPresentable, addClose: Bool = false) -> some View {
        presentable.cover
            .navigationTitle("Hello, you!")
            .withPlatformSpecificNavigationBar()
    }
}

private extension View {
    
    func withPlatformSpecificNavigationBar() -> some View {
        #if os(iOS) || os(tvOS) || os(watchOS)
        return self.navigationBarTitleDisplayMode(.inline)
        #else
        return self
        #endif
    }
}

struct SheetsScreen_Previews: PreviewProvider {
    static var previews: some View {
        SheetsScreen()
    }
}
