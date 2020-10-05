//
//  EdgeInsets+Edge.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-09-15.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import CoreGraphics
import SwiftUI

public extension EdgeInsets {
    
    /**
     Get the inset for a certain edge.
     */
    func inset(for edge: Edge) -> CGFloat {
        switch edge {
        case.top: return top
        case.bottom: return bottom
        case.leading: return leading
        case.trailing: return trailing
        }
    }
}
