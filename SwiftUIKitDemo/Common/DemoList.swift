//
//  DemoList.swift
//  SwiftUIKitDemo
//
//  Created by Daniel Saidi on 2020-03-05.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI

protocol DemoList {}

extension DemoList {
    
    var listSpacing: CGFloat { 20 }
    var topSpacer: Spacer { Spacer(minLength: topSpacing) }
    var topSpacing: CGFloat { 30 }
}
