//
//  DemoListItem.swift
//  Demo
//
//  Created by Daniel Saidi on 2020-11-26.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI

struct DemoListItem: View {
    
    init(_ text: String, _ image: Image) {
        self.text = text
        self.image = image
    }
    
    private let text: String
    private let image: Image
    
    var body: some View {
        HStack {
            image.frame(width: 20).padding(.trailing, 10)
            Text(text)
        }
    }
}

struct DemoListItem_Previews: PreviewProvider {
    static var previews: some View {
        DemoListItem("This is a list item", .gestures)
    }
}
