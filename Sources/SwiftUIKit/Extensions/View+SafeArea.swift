//
//  View+SafeArea.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-01-21.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI

public extension View {
    
    /**
     Bind the safe area insets of a certain edge and bind it
     to the provided binding parameter.
     
     This modifier is very useful when you want a view to be
     able to ignore safe areas, but its embedded views honor
     the previously ignored safe areas. Just use the binding
     to set the edge padding of the view you want to inset.
     */
    func bindSafeAreaInset(
        of edge: Edge,
        to binding: Binding<CGFloat>) -> some View {
        self.bindGeometry(to: binding) {
            self.inset(for: $0, edge: edge)
        }
    }
}

private extension View {
    
    func inset(for geo: GeometryProxy, edge: Edge) -> CGFloat {
        let insets = geo.safeAreaInsets
        switch edge {
        case .top: return insets.top
        case .bottom: return insets.bottom
        case .leading: return insets.leading
        case .trailing: return insets.trailing
        }
    }
}
