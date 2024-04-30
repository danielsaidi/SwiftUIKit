//
//  View+Label.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2023-12-19.
//  Copyright © 2023-2024 Daniel Saidi. All rights reserved.
//

import SwiftUI

public extension View {
    
    /// Convert the view to a label.
    ///
    /// - Parameters:
    ///   - text: The label text.
    func label(
        _ text: LocalizedStringKey,
        bundle: Bundle? = nil
    ) -> some View {
        Label {
            Text(text, bundle: bundle)
        } icon: {
            self
        }
    }
    
    @available(*, deprecated, renamed: "label(_:bundle:)")
    func localizedLabel(
        _ text: LocalizedStringKey,
        bundle: Bundle? = nil
    ) -> some View {
        Label {
            Text(text, bundle: bundle)
        } icon: {
            self
        }
    }
}

#Preview {
    
    VStack {
        Color.red
            .label("Preview.Label", bundle: .module)
        Image.symbol("checkmark")
            .label("Preview.Label", bundle: .module)
    }
    .frame(width: 200, height: 100)
}
