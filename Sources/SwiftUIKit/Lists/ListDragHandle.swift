#if os(iOS)
//
//  ListDragHandle.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2023-05-18.
//

import SwiftUI

/// This view can be used to display a drag handle for items in reorderable `List`.
///
/// The handle is only displayed when a list is not edited, since enabling edit mode
/// will render the native drag handle.
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

private extension ListDragHandle {

    var isEditing: Bool {
        editMode?.wrappedValue.isEditing ?? false
    }

    var shouldShowHandle: Bool {
        !isEditing
    }
}

#Preview {

    NavigationView {
        List {
            ForEach(1...10, id: \.self) { item in
                HStack {
                    Label {
                        Text("Preview.Item.\(item)", bundle: .module)
                    } icon: {
                        Color.red
                    }
                    Spacer()
                    ListDragHandle()
                }
            }
            .onMove { _, _ in }
            .onDelete { _ in }
        }
        .toolbar {
            EditButton()
        }
    }
}
#endif
