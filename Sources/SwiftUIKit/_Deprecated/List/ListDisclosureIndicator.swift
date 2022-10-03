//
//  ListDisclosureIndicator.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2021-11-03.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

import SwiftUI

@available(*, deprecated, message: "Use NavigationLinkArrow instead")
public struct ListDisclosureIndicator: View {
    
    public init() {}
    
    public var body: some View {
        Image(systemName: "chevron.forward")
            .font(.footnote.bold())
            .foregroundColor(.secondary)
            .opacity(0.5)
    }
}
