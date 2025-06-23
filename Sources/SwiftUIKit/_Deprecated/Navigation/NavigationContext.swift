//
//  NavigationContext.swift
//  NavigationContext
//
//  Created by Daniel Saidi on 2023-08-17.
//  Copyright © 2023-2025 Daniel Saidi. All rights reserved.
//

import SwiftUI

@available(*, deprecated, message: "This has been moved to https://github.com/danielsaidi/PresentationKit")
public class NavigationContext<Screen: Hashable>: ObservableObject {
    
    public init() {}

    @Published
    public var path = [Screen]()

    /// Pop a certain number of elements off the stack.
    public func goBack(_ steps: Int) {
        path.removeLast(steps)
    }

    /// Push a new screen onto the stack.
    public func push(_ screen: Screen) {
        path.append(screen)
    }
}
