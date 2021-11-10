//
//  ListDisclosureIndicator.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2021-11-03.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

#if os(iOS)
import SwiftUI

/**
 This view imitates the "list disclosure indicator" which is
 the the forward arrow that is used by list navigation links.
 
 You can use this view when a button should imitate a link.
 */
public struct ListDisclosureIndicator: View {
    
    public init() {}
    
    public var body: some View {
        Image(systemName: "chevron.forward")
            .font(.footnote.bold())
            .foregroundColor(.secondary)
            .opacity(0.5)
    }
}

struct ListDisclosureIndicator_Previews: PreviewProvider {
    
    static var previews: some View {
        ListDisclosureIndicator()
    }
}
#endif
