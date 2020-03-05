//
//  BlurScreen.swift
//  SwiftUIKitDemo
//
//  Created by Daniel Saidi on 2020-03-04.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI

struct BlurScreen: View, DemoList {
    
    var body: some View {
        ScrollView {
            topSpacer
            VStack(spacing: listSpacing) {
                ForEach(UIBlurEffect.Style.allCases, id: \.displayName) { style in
                    BlurCell(style: style)
                }
            }
        }.navigationBarTitle("BlurView")
    }
}

struct BlurScreen_Previews: PreviewProvider {
    static var previews: some View {
        BlurScreen()
    }
}
