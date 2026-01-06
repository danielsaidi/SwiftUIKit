//
//  LocalizationPreviews.swift
//  SwiftPackageScripts
//
//  Created by Daniel Saidi on 2025-11-28.
//  Copyright © 2025-2026 Daniel Saidi. All rights reserved.
//

import SwiftUI

#Preview("Internal L10n Keys") {

    NavigationStack {
        //    VStack {
        //      // Internal L10n keys
        //      Button(.l10n.general.button.close) {
        //        print("Close")
        //      }
        //      .badged(color: .blue)
        //
        //      Text(.l10n.general.notificationBadge.itemsCount(10))
        //        .badged(color: .red)
        //
        //      Text(.l10n.general.notificationBadge.warning("Danger, danger!"))
        //        .badged(color: .orange)
        //    }
        //    .navigationTitle(.l10n.app.homeScreen.title)
    }
}

extension View {

    func badged(color: Color) -> some View {
        self
            .padding(5)
            .padding(.horizontal, 5)
            .background(color)
            .foregroundStyle(.white)
            .tint(.white)
            .clipShape(.capsule)
    }
}
