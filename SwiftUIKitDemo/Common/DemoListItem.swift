//
//  DemoListItem.swift
//  SwiftUIKitDemo
//
//  Created by Daniel Saidi on 2020-03-05.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI
import SwiftUIKit

struct DemoListItem<Content: View, Effect: View>: View {
    
    init(
        title: String? = nil,
        content: Content,
        cornerRadius: CornerRadiusStyle = CornerRadiusStyle(radius: 10),
        effect: @escaping ViewEffect) {
        self.title = title
        self.content = content
        self.cornerRadius = cornerRadius
        self.effect = effect
    }
    
    typealias ViewEffect = (AnyView) -> Effect
    
    private let title: String?
    private let content: Content
    private let cornerRadius: CornerRadiusStyle
    private let effect: ViewEffect
    
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

struct DemoListItem_Previews: PreviewProvider {
    static var previews: some View {
        DemoListItem(
            title: "Hello!",
            content: Color.red,
            effect: { $0.padding() }
        )
    }
}
