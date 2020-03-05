//
//  ToastCell.swift
//  SwiftUIKitDemo
//
//  Created by Daniel Saidi on 2020-03-05.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI
import SwiftUIKit

struct ToastCell: View {
    
    let title: String
    let color: Color
    
    var body: some View {
        ZStack {
            DemoListCell(
                content: color,
                effect: { $0 }
            )
            Text(title)
        }
    }
}

struct ToastCell_Previews: PreviewProvider {
    static var previews: some View {
        ToastCell(title: "OMG!", color: .red)
    }
}
