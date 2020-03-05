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
     Read the safe area insets of a certain edge and bind it
     to the provided binding parameter.
     
     This modifier is very useful when you want a view to be
     able to ignore safe areas, but its embedded views honor
     the previously ignored safe areas. Just use the binding
     to set the edge padding of the view you want to inset.
     */
    func readSafeAreaInsets(
        edge: Edge,
        binding: Binding<CGFloat>) -> some View {
        self.background(InsetGetter(edge: edge))
            .onPreferenceChange(InsetPreferenceKey.self) {
                binding.wrappedValue = $0
        }
    }
}

private struct InsetGetter: View {
    
    let edge: Edge
    
    func inset(for geo: GeometryProxy) -> CGFloat {
        let insets = geo.safeAreaInsets
        switch edge {
        case .top: return insets.top
        case .bottom: return insets.bottom
        case .leading: return insets.leading
        case .trailing: return insets.trailing
        }
    }
    
    var body: some View {
        GeometryReader { geometry in
            Rectangle().preference(
                key: InsetPreferenceKey.self,
                value: self.inset(for: geometry)
            )
        }
    }
}

private struct InsetPreferenceKey: PreferenceKey {
    
    typealias Value = CGFloat

    static var defaultValue: CGFloat = 0

    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = max(value, nextValue())
    }
}
