//
//  CircularProgressView.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-11-01.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

#if os(iOS) || os(tvOS) || os(watchOS)
import SwiftUI

/**
 This view is just a convenience for a `ProgressView` with a
 `CircularProgressViewStyle` applied.
 */
@available(iOS 14.0, tvOS 14.0, watchOS 7.0, *)
public struct CircularProgressView: View {
    
    public init() {}
    
    public var body: some View {
        ProgressView()
            .progressViewStyle(.circular)
    }
}

@available(iOS 14.0, tvOS 14.0, watchOS 7.0, *)
struct CircularProgressView_Previews: PreviewProvider {
    
    static var previews: some View {
        CircularProgressView()
    }
}
#endif
