//
//  PageView+Previews.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2022-03-30.
//  Copyright © 2020-2024 Daniel Saidi. All rights reserved.
//

import SwiftUI

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

private struct PreviewPage: View {
    
    let type: PreviewPageType
    
    var body: some View {
        type.color.opacity(0.5)
            .overlay(Text("Preview.Page.\(type.rawValue)", bundle: .module)
                .foregroundColor(.white)
            )
    }
}

#Preview {
    
    struct StaticPreview: View {
        
        let pageIndicatorDisplayMode: PageIndicatorDisplayMode
        
        @State
        private var index = 0
        
        var body: some View {
            PageView(
                pages: [
                    PreviewPage(type: .red),
                    PreviewPage(type: .green),
                    PreviewPage(type: .blue)
                ],
                currentPageIndex: $index,
                pageIndicatorDisplayMode: pageIndicatorDisplayMode
            )
        }
    }
    
    struct DynamicPreview: View {
        
        let pageIndicatorStyle: PageIndicatorStyle
        
        @State
        private var index = 0
        
        var body: some View {
            PageView(
                items: PreviewPageType.allCases,
                currentPageIndex: $index
            ) {
                PreviewPage(type: $0)
            }
            
        }
    }
    
    return VStack {
        StaticPreview(pageIndicatorDisplayMode: .automatic)
        StaticPreview(pageIndicatorDisplayMode: .never)
        StaticPreview(pageIndicatorDisplayMode: .always)
            .pageIndicatorStyle(.init(dotColor: .green))
    }
}
