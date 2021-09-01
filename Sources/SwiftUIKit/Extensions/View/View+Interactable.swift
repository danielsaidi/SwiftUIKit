//
//  View+Interactable.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2021-03-22.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

import SwiftUI

public extension View {
    
    /**
     Add an interactable background color to make the entire
     view interactable, not just the parts that have content.
     */
    func interactable() -> some View {
        self.background(Color.clearInteractable)
    }
}
