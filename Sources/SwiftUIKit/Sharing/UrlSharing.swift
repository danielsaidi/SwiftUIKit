//
//  UrlSharing.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2021-08-31.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

import SwiftUI

public protocol UrlSharing: View {
    
    var sheet: SheetContext { get }
}

public extension UrlSharing {
    
    func share(_ url: URL) {
        sheet.present(ShareSheet(activityItems: [url]))
    }
}
