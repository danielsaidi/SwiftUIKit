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
        button = Button(action: action) {
            DemoListItem(text, image)
        }
    }
    
    private let button: Button<DemoListItem>
    
    var body: some View { button
        .buttonStyle(PlainButtonStyle())
    }
}

struct DemoListButton_Previews: PreviewProvider {
    static var previews: some View {
        DemoListButton("This is a button", .blur) { print("You tapped me!") }
    }
}
