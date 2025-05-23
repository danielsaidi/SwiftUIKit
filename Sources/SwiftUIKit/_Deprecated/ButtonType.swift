//
//  ButtonType.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2024-04-30.
//  Copyright © 2024-2025 Daniel Saidi. All rights reserved.
//

import SwiftUI

@available(*, deprecated, message: "ButtonType has been moved to https://github.com/danielsaidi/ButtonKit")
public extension Button {
    
    /// Create a new ``ButtonType``-based button.
    ///
    /// You have to tint the icon separately for destructive
    /// buttons like ``ButtonType/delete``. This can be done
    /// automatically, by using `.labelStyle(.titleAndIcon)`.
    @_disfavoredOverload
    init(
        _ type: ButtonType,
        _ title: LocalizedStringKey? = nil,
        _ icon: Image? = nil,
        bundle: Bundle? = nil,
        action: @escaping () -> Void
    ) where Label == SwiftUI.Label<Text, Image?> {
        self.init(
            role: type.role,
            action: action
        ) {
            let bundle: Bundle? = title == nil ? .module : bundle
            let displayTitle = title ?? type.title
            let icon = icon ?? type.image
            Label(
                title: { Text(displayTitle, bundle: bundle) },
                icon: { icon }
            )
        }
    }
}

@available(*, deprecated, message: "ButtonType has been moved to https://github.com/danielsaidi/ButtonKit")
public enum ButtonType: String, CaseIterable, Identifiable {
    case add, addToFavorites,
         cancel, call, close, copy,
         delete, deselect, done,
         edit, email, export,
         like,
         ok,
         paste,
         removeFromFavorites, removeLike,
         save, search, select, share
}

@available(*, deprecated, message: "ButtonType has been moved to https://github.com/danielsaidi/ButtonKit")
public extension ButtonType {
    
    static func toggleFavorite(isFavorite: Bool) -> ButtonType {
        isFavorite ? .removeFromFavorites : .addToFavorites
    }
    
    static func toggleLike(isLiked: Bool) -> ButtonType {
        isLiked ? .removeLike : .like
    }
    
    static func toggleSelect(isSelected: Bool) -> ButtonType {
        isSelected ? .deselect : .select
    }

    var id: String { rawValue }
    
    var image: Image? {
        guard let imageName else { return nil }
        return .symbol(imageName)
    }
    
    var imageName: String? {
        switch self {
        case .add: "plus"
        case .addToFavorites: "star"
        case .cancel: "xmark"
        case .close: "xmark.circle"
        case .call: "phone"
        case .copy: "doc.on.doc"
        case .delete: "trash"
        case .deselect: "checkmark.circle.fill"
        case .done: "checkmark"
        case .edit: "pencil"
        case .email: "envelope"
        case .export: "square.and.arrow.up"
        case .like: "heart"
        case .ok: "checkmark"
        case .paste: "clipboard"
        case .removeFromFavorites: "star.fill"
        case .removeLike: "heart.fill"
        case .save: "checkmark"
        case .search: "magnifyingglass"
        case .select: "checkmark.circle"
        case .share: "square.and.arrow.up"
        }
    }
    
    #if os(iOS) || os(macOS)
    var keyboardShortcut: (key: KeyEquivalent, modifiers: EventModifiers?)? {
        switch self {
        case .add: ("a", .command)
        case .cancel: (.escape, nil)
        case .close: (.escape, nil)
        case .done: (.return, .command)
        case .edit: ("e", .command)
        case .save: ("s", .command)
        case .search: ("f", .command)
        default: nil
        }
    }
    #endif
    
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
        case .addToFavorites: "Button.AddToFavorites"
        case .call: "Button.Call"
        case .cancel: "Button.Cancel"
        case .close: "Button.Close"
        case .copy: "Button.Copy"
        case .deselect: "Button.Deselect"
        case .edit: "Button.Edit"
        case .email: "Button.Email"
        case .export: "Button.Export"
        case .delete: "Button.Delete"
        case .done: "Button.Done"
        case .like: "Button.Like"
        case .ok: "Button.OK"
        case .paste: "Button.Paste"
        case .removeFromFavorites: "Button.RemoveFromFavorites"
        case .removeLike: "Button.RemoveLike"
        case .save: "Button.Save"
        case .search: "Button.Search"
        case .select: "Button.Select"
        case .share: "Button.Share"
        }
    }
}

@available(*, deprecated, message: "ButtonType has been moved to https://github.com/danielsaidi/ButtonKit")
public extension View {
    
    @ViewBuilder
    func keyboardShortcut(
        _ button: ButtonType
    ) -> some View {
        #if os(iOS) || os(macOS)
        if let shortcut = button.keyboardShortcut {
            if let modifiers = shortcut.modifiers {
                self.keyboardShortcut(shortcut.key, modifiers: modifiers)
            } else {
                self.keyboardShortcut(shortcut.key)
            }
        } else {
            self
        }
        #else
        self
        #endif
    }
}
