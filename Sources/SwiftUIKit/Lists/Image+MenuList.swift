//
//  Image+MenuList.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2021-02-18.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

import SwiftUI

public extension Image {
    
    /**
     This image represents a detail disclosure indicator for
     a list item.
     */
    static var menuListNavigationArrow: Image { Image(systemName: "chevron.right") }
}

struct Image_App_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Image.menuListNavigationArrow
        }
    }
}
