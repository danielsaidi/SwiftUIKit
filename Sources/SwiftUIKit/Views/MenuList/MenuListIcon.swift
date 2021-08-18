//
//  MenuListItemIcon.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2021-08-01.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

import SwiftUI

/**
 This view is used by `MenuListItem` as the leading icon.
 */
public struct MenuListIcon<Icon: View>: View {
    
    public init(_ icon: Icon) {
        self.icon = icon
    }
    
    private let icon: Icon
    
    public var body: some View {
        icon.frame(width: 20)
            .padding(.trailing, 10)
    }
}

struct MenuListItemIcon_Previews: PreviewProvider {
    
    static var previews: some View {
        MenuListIcon(Image(systemName: "plus"))
    }
}
