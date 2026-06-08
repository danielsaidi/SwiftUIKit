#if os(iOS)
//
//  ListDragHandle.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2023-05-18.
//  Copyright © 2023-2026 Daniel Saidi. All rights reserved.
//

import SwiftUI

@available(*, deprecated, message: "This has been moved to the new ListKit library.")
public struct ListDragHandle: View {

    public init() {}

    @Environment(\.editMode)
    private var editMode

    public var body: some View {
        if shouldShowHandle {
            Image(systemName: "line.3.horizontal")
                .font(Font.title2.weight(.light))
                .foregroundColor(.secondary)
                .opacity(0.5)
        }
    }
}

@available(*, deprecated, message: "This has been moved to the new ListKit library.")
private extension ListDragHandle {

    var isEditing: Bool {
        editMode?.wrappedValue.isEditing ?? false
    }

    var shouldShowHandle: Bool {
        !isEditing
    }
}
#endif
