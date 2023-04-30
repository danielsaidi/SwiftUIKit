//
//  DetentsScreen.swift
//  Demo (iOS)
//
//  Created by Daniel Saidi on 2023-04-30.
//  Copyright © 2023 Daniel Saidi. All rights reserved.
//

import SwiftUI

struct DetentsScreen: View {

    @State
    var isSheetPresented = true

    var body: some View {
        List {
            Section {
                Text("You can pull the sheet to 35% of the screen height without dimming the underlying view.")
            }
        }
        .navigationTitle("Undimmed Presentation Detents")
        .sheet(isPresented: $isSheetPresented, content: sheet)
    }

    func sheet() -> some View {
        Color.red
            .ignoresSafeArea()
            .withDetentsIfPossible()
            .withInteractiveDismissDisabledIfPossible()
    }
}

extension View {

    @ViewBuilder
    func withDetentsIfPossible() -> some View {
        if #available(iOS 16.0, *) {
            self.presentationDetents(
                undimmed: [
                    .fraction(0.15),
                    .fraction(0.3)
                ],
                dimmed: [.medium]
            )
        } else {
            self
        }
    }

    @ViewBuilder
    func withInteractiveDismissDisabledIfPossible() -> some View {
        if #available(iOS 15.0, *) {
            self.interactiveDismissDisabled()
        } else {
            self
        }
    }
}
