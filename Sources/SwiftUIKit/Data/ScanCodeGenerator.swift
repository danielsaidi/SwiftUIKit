//
//  ScanCodeGenerator.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2021-08-03.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

import SwiftUI

/**
 This protocol can be implemented by classes that can create
 scan code images and image views.
 */
public protocol ScanCodeGenerator {

    func generateCode(of type: ScanCodeType, from string: String) -> ImageResource?
    func generateCodeView(of type: ScanCodeType, from string: String) -> Image?
}
