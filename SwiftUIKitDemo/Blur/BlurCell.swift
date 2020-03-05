//
//  BlurCell.swift
//  SwiftUIKitDemo
//
//  Created by Daniel Saidi on 2019-09-11.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI
import SwiftUIKit

struct BlurCell: View {
    let style: UIBlurEffect.Style
    
    var body: some View {
        VStack {
            Text(style.displayName)
                .font(.callout)
            
            Image("BlurImage")
                .resizable()
                .blur(style: style)
                .frame(height: 200)
                .cornerRadius(10)
                .padding([.leading, .trailing])
        }
    }
}

struct BlurCell_Previews: PreviewProvider {
    static var previews: some View {
        BlurCell(style: .regular)
    }
}
