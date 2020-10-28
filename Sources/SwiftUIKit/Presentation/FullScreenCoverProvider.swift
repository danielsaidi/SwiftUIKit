//
//  FullScreenCoverProvider.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-10-28.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI

/**
 This protocol can be implemented by anything (e.g. a struct,
 enum etc.) that can provide a `full screen cover` view that
 can be presented as a full screen cover.
 */
public protocol FullScreenCoverProvider {
    
    var cover: AnyView { get }
}
