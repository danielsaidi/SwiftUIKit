//
//  Labelable.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2026-08-03.
//  Copyright © 2026 Daniel Saidi. All rights reserved.
//

import SwiftUI

public protocol Labelable {

    associatedtype LabelIcon: View

    /// The app screen's label title.
    var labelTitle: LocalizedStringResource { get }

    /// The app screen's label icon.
    var labelIcon: LabelIcon { get }
}


public extension Label where Title == Text {

    /// Create a label with a `Labelable` value.
    init<Value: Labelable>(
        for value: Value
    ) where Icon == Value.LabelIcon {
        self.init {
            Text(value.labelTitle)
        } icon: {
            value.labelIcon
        }
    }

    @available(*, deprecated, renamed: "init(for:)")
    init<Value: Labelable>(
        _ value: Value
    ) where Icon == Value.LabelIcon {
        self.init(for: value)
    }
}

public extension Button {

    /// Create a button with a `Labelable` value.
    init<Value: Labelable>(
        for value: Value,
        action: @escaping () -> Void
    ) where Label == SwiftUI.Label<Text, Value.LabelIcon> {
        self.init(action: action) {
            Label(for: value)
        }
    }

    @available(*, deprecated, renamed: "init(for:action:)")
    init<Value: Labelable>(
        _ value: Value,
        action: @escaping () -> Void
    ) where Label == SwiftUI.Label<Text, Value.LabelIcon> {
        self.init(for: value, action: action)
    }
}

public extension NavigationLink {

    /// Create a value-based link with a `Labelable` value.
    init<Value: Labelable & Hashable>(
        for value: Value
    ) where Label == SwiftUI.Label<Text, Value.LabelIcon>, Destination == Never {
        self.init(value: value) {
            Label(for: value)
        }
    }

    /// Create a destination-based link with a `Labelable` value.
    init<Value: Labelable & Hashable>(
        for value: Value,
        @ViewBuilder destination: () -> Destination
    ) where Label == SwiftUI.Label<Text, Value.LabelIcon> {
        self.init(destination: destination) {
            Label(for: value)
        }
    }

    @available(*, deprecated, renamed: "init(for:)")
    init<Value: Labelable & Hashable>(
        _ value: Value,
        action: @escaping () -> Void
    ) where Label == SwiftUI.Label<Text, Value.LabelIcon>, Destination == Never {
        self.init(for: value)
    }
}

private enum PreviewScreen: Labelable {

    case settings

    var labelTitle: LocalizedStringResource { "Settings" }
    var labelIcon: some View { Image(systemName: "gearshape") }
}

#Preview {

    if #available(iOS 16, macOS 14, tvOS 16, watchOS 10, *) {
        List {
            Label(for: PreviewScreen.settings)
            Button(for: PreviewScreen.settings) {
                print("Settings tapped")
            }
        }
    }
}
