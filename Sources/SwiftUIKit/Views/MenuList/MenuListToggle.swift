//
//  MenuListItemStack.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2021-02-11.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

import SwiftUI

/**
 A menu list toggle is a specialized toggle that takes up as
 much vertical space as a menu list text view.
 */
public struct MenuListToggle: View {
    
    public init(
        _ title: String,
        isOn: Binding<Bool>) {
        self.title = title
        self.isOn = isOn
    }
    
    private let title: String
    private let isOn: Binding<Bool>
    
    public var body: some View {
        Toggle(title, isOn: isOn)
            .padding(.vertical, 8)
    }
}
