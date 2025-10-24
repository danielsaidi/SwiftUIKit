//
//  EditableView.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2023-06-21.
//  Copyright © 2023-2025 Daniel Saidi. All rights reserved.
//

#if os(iOS) || os(tvOS)
import SwiftUI

/// This protocol can be implemented by any view that should be able to toggle its
/// edit mode.
///
/// To implement the protocol just add an `editMode` binding:
///
/// ```swift
/// @Environment(\.editMode)
/// var editMode
/// ```
///
/// You can check the ``isEditing``, and set it with ``setIsEditing(_:)``.
public protocol EditableView: View {
    
    var editMode: Binding<EditMode>? { get }
}

public extension EditableView {
    
    /// Whether or not this view is currently being edited.
    var isEditing: Bool {
        editMode?.wrappedValue.isEditing ?? false
    }

    /// Set the edit mode of the view.
    func setIsEditing(_ isEditing: Bool) {
        editMode?.wrappedValue = isEditing ? .active : .inactive
    }
}
#endif
