//
//  DemoListCell.swift
//  SwiftUIKitDemo
//
//  Created by Daniel Saidi on 2020-03-05.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI

struct DemoListCell<Content: View, Effect: View>: View {
    
    init(
        title: String? = nil,
        content: Content,
        effect: @escaping (AnyView) -> Effect) {
        self.title = title
        self.content = content
        self.effect = effect
    }
    
    private let title: String?
    private let content: Content
    private let effect: (AnyView) -> Effect
    
    var body: some View {
        VStack {
            if title != nil {
                Text(title ?? "").font(.callout)
            }
            
            effect(
                content
                    .frame(height: 200)
                    .cornerRadius(10)
                    .padding(.horizontal)
                    .any()
            )
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
