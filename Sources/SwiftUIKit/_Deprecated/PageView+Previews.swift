//
//  PageView+Previews.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2022-03-30.
//  Copyright © 2020-2025 Daniel Saidi. All rights reserved.
//

import SwiftUI

@available(*, deprecated, message: "This has been moved to https://github.com/danielsaidi/PageView")
private enum PreviewPageType: String, CaseIterable {
    
    case red, green, blue
    
    var color: Color {
        switch self {
        case .red: return .red
        case .green: return .green
        case .blue: return .blue
        }
    }
}

@available(*, deprecated, message: "This has been moved to https://github.com/danielsaidi/PageView")
private struct PreviewPage: View {
    
    let type: PreviewPageType
    
    var body: some View {
        type.color.opacity(0.5)
            .overlay(Text("Preview.Page.\(type.rawValue)", bundle: .module)
                .foregroundColor(.white)
            )
    }
}
