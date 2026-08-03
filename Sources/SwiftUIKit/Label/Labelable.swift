//
//  Labelable.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2026-08-03.
//  Copyright © 2026 Daniel Saidi. All rights reserved.
//

import SwiftUI

@available(iOS 16, macOS 14, tvOS 16, watchOS 10, *)
public protocol Labelable {

    associatedtype LabelIcon: View

    /// The app screen's label title.
    var labelTitle: LocalizedStringResource { get }

    /// The app screen's label icon.
    var labelIcon: LabelIcon { get }
}


@available(iOS 16, macOS 14, tvOS 16, watchOS 10, *)
public extension Label where Title == Text {

    /// Create a label with a `Labelable` value.
    init<Value: Labelable>(
        _ value: Value
    ) where Icon == Value.LabelIcon {
        self.init {
            Text(value.labelTitle)
        } icon: {
            value.labelIcon
        }
    }
}

@available(iOS 16, macOS 14, tvOS 16, watchOS 10, *)
public extension Button {

    /// Create a button with a `Labelable` value.
    init<Value: Labelable>(
        _ value: Value,
        action: @escaping () -> Void
    ) where Label == SwiftUI.Label<Text, Value.LabelIcon> {
        self.init(action: action) {
            SwiftUI.Label(value)
        }
    }
}

@available(iOS 16, macOS 14, tvOS 16, watchOS 10, *)
private enum PreviewScreen: Labelable {

    case settings

    var labelTitle: LocalizedStringResource { "Settings" }
    var labelIcon: some View { Image(systemName: "gearshape") }
}

#Preview {

    if #available(iOS 16, macOS 14, tvOS 16, watchOS 10, *) {
        List {
            Label(PreviewScreen.settings)
            Button(PreviewScreen.settings) {
                print("Settings tapped")
            }
        }
    }
}
