//
//  OpenURLAction+Optional.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2026-05-26.
//  Copyright © 2026 Daniel Saidi. All rights reserved.
//

import SwiftUI

public extension OpenURLAction {

    func tryOpen(_ url: URL?) {
        guard let url else { return }
        callAsFunction(url)
    }

    func tryOpen(_ urlString: String?) {
        guard let urlString else { return }
        guard let url = URL(string: urlString) else { return }
        tryOpen(url)
    }
}
