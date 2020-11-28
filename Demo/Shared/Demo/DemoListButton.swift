//
//  DemoListButton.swift
//  Demo
//
//  Created by Daniel Saidi on 2020-11-26.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI

struct DemoListButton: View {
    
    init(_ text: String, _ action: @escaping () -> Void) {
        self.init(text, nil, action)
    }
    
    init(_ text: String, _ image: Image?, _ action: @escaping () -> Void) {
        self.text = text
        self.image = image
        self.action = action
    }
    
    private let text: String
    private let image: Image?
    private let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack {
                DemoListItem(text, image)
                Spacer()
            }.background(Color.clearInteractable)
        }
        .buttonStyle(PlainButtonStyle())
    }
}

struct DemoListButton_Previews: PreviewProvider {
    static var previews: some View {
        DemoListButton("This is a button", .blur) { print("You tapped me!") }
    }
}
