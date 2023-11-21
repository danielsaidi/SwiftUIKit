//
//  View+FullScreenCover.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-10-28.
//  Copyright © 2020-2023 Daniel Saidi. All rights reserved.
//

#if os(iOS) || os(tvOS) || os(watchOS) 
import SwiftUI

public extension View {
    
    /**
     Present a cover with a certain context. 
     
     The cover will be presented when the context is active.
     */
    func fullScreenCover(_ context: FullScreenCoverContext) -> some View {
        fullScreenCover(
            isPresented: context.isActiveBinding,
            content: context.content ?? EmptyView().any)
    }
}
#endif
