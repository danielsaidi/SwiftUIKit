//
//  ListToggle.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2021-10-28.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

import SwiftUI

@available(*, deprecated, message: "Just use a regular toggle instead")
public struct ListToggle<Content: View>: View {
    
    public init(
        isOn: Binding<Bool>,
        @ViewBuilder content: @escaping () -> Content) {
        self.isOn = isOn
        self.content = content
    }
    
    private let isOn: Binding<Bool>
    private let content: () -> Content
    
    public var body: some View {
        HStack {
            content()
            Spacer()
            Toggle("", isOn: isOn)
                .labelsHidden()
        }
    }
}
