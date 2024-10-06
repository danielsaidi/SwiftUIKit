//
//  AlertContext.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-06-07.
//  Copyright © 2020-2024 Daniel Saidi. All rights reserved.
//

import Combine
import SwiftUI

/// This context is shared by presentation-specific contexts,
/// and can be used to present different views.
///
/// To use the context, create an observed instance and bind
/// it to a view hierarchy, for instance by passing it in as
/// an environment object or with sub-class view modifiers.
///
/// You can also setup a global context and pass it into the
/// view hierarchy as an environment object.
open class PresentationContext<Content>: ObservableObject {

    public init() {}

    @Published
    public var isActive = false

    @Published
    public internal(set) var content: (() -> Content)? {
        didSet { isActive = content != nil }
    }
}

@MainActor
public extension PresentationContext {

    var isActiveBinding: Binding<Bool> {
        .init(get: { self.isActive },
              set: { self.isActive = $0 }
        )
    }
        
    func dismiss() {
        DispatchQueue.main.async {
            self.isActive = false
        }
    }

    func presentContent(_ content: @autoclosure @escaping () -> Content) {
        DispatchQueue.main.async {
            self.content = content
        }
    }
}
