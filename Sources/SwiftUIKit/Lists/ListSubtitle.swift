//
//  ListSubtitle.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2022-02-04.
//  Copyright © 2022-2024 Daniel Saidi. All rights reserved.
//

import SwiftUI

/// This view can be used as a trailing list row subtitle.
public struct ListSubtitle: View {

    public init(
        _ text: LocalizedStringKey,
        bundle: Bundle? = nil
    ) {
        self.text = text
        self.bundle = bundle
    }
    
    private let text: LocalizedStringKey
    private let bundle: Bundle?
    
    public var body: some View {
        Text(text, bundle: bundle)
            .font(.footnote)
            .foregroundColor(.secondary)
            .lineLimit(1)
    }
}

#Preview {
    
    List {
        HStack {
            Label {
                Text("Preview.Label", bundle: .module)
            } icon: {
                Color.red
            }
            Spacer()
            ListSubtitle("Preview.Subtitle", bundle: .module)
        }
    }
}
