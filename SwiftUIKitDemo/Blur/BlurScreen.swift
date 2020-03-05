//
//  BlurScreen.swift
//  SwiftUIKitDemo
//
//  Created by Daniel Saidi on 2020-03-04.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI

struct BlurScreen: View {
    var body: some View {
        ScrollView {
            ForEach(UIBlurEffect.Style.allCases, id: \.displayName) { style in
                BlurCell(style: style)
                    .padding(.top)
            }
        }.navigationBarTitle("BlurView")
    }
}

struct BlurScreen_Previews: PreviewProvider {
    static var previews: some View {
        BlurScreen()
    }
}
