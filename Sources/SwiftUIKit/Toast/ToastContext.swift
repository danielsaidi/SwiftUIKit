//
//  ToastContext.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-03-18.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI

/**
 This class can be used to manage the presentation state and
 content of a view's toast, so that you don't have to manage
 several properties.
 */
public class ToastContext: ObservableObject {
    
    public init() {}
    
    @Published public var isPresented = false
    @Published public var text = ""
    @Published public var content = EmptyView().any()
    
    public func setText(_ text: String) {
        self.text = text
        self.isPresented = !text.isEmpty
    }
    
    public func setContent<Content: View>(_ content: Content) {
        self.content = content.any()
        self.isPresented = true
    }
}
