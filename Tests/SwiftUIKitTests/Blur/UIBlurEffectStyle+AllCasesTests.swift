//
//  UIBlurEffectStyle+AllCasesTests.swift
//  SwiftUIKitTests
//
//  Created by Daniel Saidi on 2019-08-30.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

#if os(iOS)
import XCTest
import SwiftUIKit
import UIKit

final class UIBlurEffectStyle_AllCasesTests: XCTestCase {
    
    func testAllCasesAreCorrectlySetup() {
        let result = UIBlurEffect.Style.allCases
        let expected: [UIBlurEffect.Style] = [
            .regular,
            .prominent,
            
            .systemUltraThinMaterial,
            .systemThinMaterial,
            .systemMaterial,
            .systemThickMaterial,
            .systemChromeMaterial,
            
            .systemUltraThinMaterialLight,
            .systemThinMaterialLight,
            .systemMaterialLight,
            .systemThickMaterialLight,
            .systemChromeMaterialLight,
            
            .systemUltraThinMaterialDark,
            .systemThinMaterialDark,
            .systemMaterialDark,
            .systemThickMaterialDark,
            .systemChromeMaterialDark,
            
            .extraLight,
            .light,
            .dark
        ]
        XCTAssertEqual(result, expected)
    }
}
#endif
