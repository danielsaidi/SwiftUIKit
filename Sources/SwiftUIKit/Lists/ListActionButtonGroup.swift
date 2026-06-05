//
//  ListActionButtonGroup.swift
//  Vinylsamlaren
//
//  Created by Daniel Saidi on 2026-05-26.
//

import SwiftUI

/// This view renders a horizontal list action buttons list.
@available(iOS 26.0, *)
public struct ListActionButtonGroup<Content: View>: View {

    public init(
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.content = content
    }

    private let content: () -> Content

    public var body: some View {
        HStack(spacing: 10) {
            Group {
                content()
            }
            .tint(.accentColor)
            .buttonStyle(.bordered)
            .buttonBorderShape(.roundedRectangle)
        }
        .listRowBackground(Color.clear)
        .listRowInsets(.init(top: 16, leading: 0, bottom: 16, trailing: 0))
    }
}

#Preview {

    if #available(iOS 26.0, *) {
        List {
            ListActionButtonGroup {
                ListActionButton(title: "Do It", icon: .symbol("checkmark")) {}
                ListActionButton(title: "Do It", icon: .symbol("checkmark")) {}
                ListActionButton(title: "Do It", icon: .symbol("checkmark")) {}
                ListActionButton(title: "Do It", icon: .symbol("checkmark")) {}
            }
        }
    }
}
