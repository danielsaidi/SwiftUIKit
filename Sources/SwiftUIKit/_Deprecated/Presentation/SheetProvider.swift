//
//  SheetProvider.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-06-06.
//  Copyright © 2020-2023 Daniel Saidi. All rights reserved.
//

import SwiftUI

@available(*, deprecated, message: "Just present plain views instead.")
public protocol SheetProvider {
    
    var sheet: AnyView { get }
}

public extension SheetContext {
    
    @available(*, deprecated, message: "Just present plain views instead.")
    func present(_ provider: SheetProvider) {
        present(provider.sheet)
    }
}
