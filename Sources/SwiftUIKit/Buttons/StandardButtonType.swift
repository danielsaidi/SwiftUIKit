//
//  Button+Standard.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2024-04-30.
//  Copyright © 2024-2025 Daniel Daniel Saidi. All rights reserved.
//

import SwiftUI

public extension Button {
    
    /// Create a new ``StandardType``-based button.
    init(
        _ type: ButtonType,
        _ title: LocalizedStringKey? = nil,
        _ icon: Image? = nil,
        bundle: Bundle? = nil,
        action: @escaping () -> Void
    ) where Label == SwiftUI.Label<Text, Image?> {
        self.init(role: type.role, action: action) {
            Label(
                title: { Text(title ?? type.title, bundle: title == nil ? .module : bundle) },
                icon: { icon ?? type.image }
            )
        }
    }
}


/// This enum defines standard button types and provides
/// standard localized texts and icons.
public enum ButtonType: String, CaseIterable, Identifiable {
    case add, addFavorite, addToFavorites,
         cancel, call, copy,
         delete, deselect, done,
         edit, email,
         ok,
         paste,
         removeFavorite, removeFromFavorites,
         search, select, share
}

public extension ButtonType {
    
    var id: String { rawValue }
    
    var image: Image? {
        guard let imageName else { return nil }
        return .symbol(imageName)
    }
    
    var imageName: String? {
        switch self {
        case .add: "plus"
        case .addFavorite: "star.circle"
        case .addToFavorites: "star.circle"
        case .cancel: "xmark"
        case .call: "phone"
        case .copy: "doc.on.doc"
        case .delete: "trash"
        case .deselect: "checkmark.circle.fill"
        case .done: "checkmark"
        case .edit: "pencil"
        case .email: "envelope"
        case .ok: "checkmark"
        case .paste: "clipboard"
        case .removeFavorite: "star.circle.fill"
        case .removeFromFavorites: "star.circle.fill"
        case .search: "magnifyingglass"
        case .select: "checkmark.circle"
        case .share: "square.and.arrow.up"
        }
    }
    
    var keyboardShortcut: KeyEquivalent? {
        switch self {
        case .search: "f"
        default: nil
        }
    }
    
    var keyboardShortcutModifier: EventModifiers? {
        switch self {
        default: .command
        }
    }
    
    var role: ButtonRole? {
        switch self {
        case .cancel: .cancel
        case .delete: .destructive
        default: nil
        }
    }
    
    var title: LocalizedStringKey {
        switch self {
        case .add: "Button.Add"
        case .addFavorite: "Button.AddFavorite"
        case .addToFavorites: "Button.AddToFavorites"
        case .call: "Button.Call"
        case .cancel: "Button.Cancel"
        case .copy: "Button.Copy"
        case .deselect: "Button.Deselect"
        case .edit: "Button.Edit"
        case .email: "Button.Email"
        case .delete: "Button.Delete"
        case .done: "Button.Done"
        case .ok: "Button.OK"
        case .paste: "Button.Paste"
        case .removeFavorite: "Button.RemoveFavorite"
        case .removeFromFavorites: "Button.RemoveFromFavorites"
        case .search: "Button.Search"
        case .select: "Button.Select"
        case .share: "Button.Share"
        }
    }
}

public extension View {
    
    @ViewBuilder
    func keyboardShortcut(
        _ button: ButtonType
    ) -> some View {
        if let shortcut = button.keyboardShortcut {
            if let modifier = button.keyboardShortcutModifier {
                self.keyboardShortcut(shortcut, modifiers: modifier)
            } else {
                self.keyboardShortcut(shortcut)
            }
        } else {
            self
        }
    }
}

/*
#Preview {
    
    @ViewBuilder
    func buttons() -> some View {
        Section {
            ForEach(Button.StandardType.allCases) { type in
                Button(type) { print("Tapped \(type.title)") }
            }
        }
    }
    
    return List {
        buttons()
        buttons().labelStyle(.titleOnly)
        buttons().labelStyle(.iconOnly)
    }
    .toolbar {
        ToolbarItemGroup {
            buttons()
        }
    }
}
*/
