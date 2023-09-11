//
//  AlertProvider.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-06-07.
//  Copyright © 2020-2023 Daniel Saidi. All rights reserved.
//

import SwiftUI

@available(*, deprecated, message: "Just present plain alerts instead.")
public protocol AlertProvider {
    
    var alert: Alert { get }
}

public extension AlertContext {

    @available(*, deprecated, message: "Just present plain alerts instead.")
    func present(_ provider: AlertProvider) {
        present(provider.alert)
    }
}
