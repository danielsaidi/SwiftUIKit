//
//  EditableView.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2023-06-21.
//  Copyright © 2023-2024 Daniel Saidi. All rights reserved.
//

#if os(iOS) || os(tvOS)
import SwiftUI

/**
 This protocol simplifies checking and setting the edit mode.
 
 Implement the protocol and add an `editMode` binding:

 ```swift
 @Environment(\.editMode)
 var editMode
 ```

 You can then check the edit mode state with `isEditing` and
 set it with `setIsEditing(_:)`.
 */
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
