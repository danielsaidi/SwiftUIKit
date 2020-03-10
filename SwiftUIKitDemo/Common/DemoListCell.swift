//
//  DemoListCell.swift
//  SwiftUIKitDemo
//
//  Created by Daniel Saidi on 2020-03-05.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI
import SwiftUIKit

struct DemoListCell<Content: View, Effect: View>: View {
    
    init(
        title: String? = nil,
        content: Content,
        cornerRadius: CornerRadiusStyle = CornerRadiusStyle(radius: 10),
        effect: @escaping (AnyView) -> Effect) {
        self.title = title
        self.content = content
        self.cornerRadius = cornerRadius
        self.effect = effect
    }
    
    private let title: String?
    private let content: Content
    private let cornerRadius: CornerRadiusStyle
    private let effect: (AnyView) -> Effect
    
    var body: some View {
        ZStack {
            effect(
                content
                    .frame(height: 200)
                    .cornerRadius(cornerRadius)
                    .padding(.horizontal)
                    .any()
            )
            
            if title != nil {
                Text(title ?? "").font(.callout)
            }
        }
    }
}

struct DemoListCell_Previews: PreviewProvider {
    static var previews: some View {
        DemoListCell(
            title: "Hello!",
            content: Color.red,
            effect: { $0.padding() }
        )
    }
}
