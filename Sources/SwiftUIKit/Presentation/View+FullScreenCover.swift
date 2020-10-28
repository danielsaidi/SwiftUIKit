//
//  View+FullScreenCover.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-10-28.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI

@available(iOS 14.0, *)
public extension View {
    
    /**
     Present a cover from a certain context. The cover will be
     will be presented when the context is active.
     */
    func fullScreenCover(context: FullScreenCoverContext) -> some View {
        fullScreenCover(isPresented: context.isActiveBinding, content: context.content)
    }
}
