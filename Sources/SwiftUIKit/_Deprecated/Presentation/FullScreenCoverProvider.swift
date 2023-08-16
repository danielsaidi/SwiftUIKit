//
//  FullScreenCoverProvider.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-10-28.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI

@available(iOS 14.0, tvOS 14.0, watchOS 7.0, *)
@available(*, deprecated, message: "Just present plain Alert values instead.")
public protocol FullScreenCoverProvider {
    
    var cover: AnyView { get }
}

@available(iOS 14.0, tvOS 14.0, watchOS 7.0, *)
public extension FullScreenCoverContext {

    @available(*, deprecated, message: "Just present plain Alert values instead.")
    func present(_ provider: FullScreenCoverProvider) {
        present(provider.cover)
    }
}
