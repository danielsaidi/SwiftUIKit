//
//  View+Geometry.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-03-26.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI

public extension View {
    
    /**
     Bind the view's safe area to a binding.
     */
    func bindSafeAreaInsets(to binding: Binding<EdgeInsets>) -> some View {
        background(safeAreaBindingView(for: binding))
    }
    
    /**
     Bind the view's size to a binding.

     Do not overuse this modifier. Since the size binding is
     calculated as the view is being rendered, it will start
     with an incorrect initial binding value, which may give
     you glitches depending on how you use the size value.
    */
    func bindSize(to binding: Binding<CGSize>) -> some View {
        background(sizeBindingView(for: binding))
    }
}

private extension View {
    
    func changeStateAsync(_ action: @escaping () -> Void) {
        DispatchQueue.main.async(execute: action)
    }
    
    func safeAreaBindingView(for binding: Binding<EdgeInsets>) -> some View {
        GeometryReader { geo in
            self.safeAreaBindingView(for: binding, geo: geo)
        }
    }
    
    func safeAreaBindingView(for binding: Binding<EdgeInsets>, geo: GeometryProxy) -> some View {
        changeStateAsync {
            if binding.wrappedValue == geo.safeAreaInsets { return }
            binding.wrappedValue = geo.safeAreaInsets
        }
        return Color.clear
    }
    
    func sizeBindingView(for binding: Binding<CGSize>) -> some View {
        GeometryReader { geo in
            self.sizeBindingView(for: binding, geo: geo)
        }
    }
    
    func sizeBindingView(for binding: Binding<CGSize>, geo: GeometryProxy) -> some View {
        changeStateAsync {
            if binding.wrappedValue == geo.size { return }
            binding.wrappedValue = geo.size
        }
        return Color.clear
    }
}
