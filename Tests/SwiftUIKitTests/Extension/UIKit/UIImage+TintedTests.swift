//
//  UIImage+TintedTests.swift
//  KeyboardKitTests
//
//  Created by Daniel Saidi on 2019-05-06.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

#if os(iOS)
import Quick
import Nimble
import SwiftUIKit
import UIKit

class UIImage_TintedTests: QuickSpec {
    
    override func spec() {
        
        describe("tinting with color and blend mode") {
            
            it("returns tinted image") {
                let image = UIImage().resized(to: CGSize(width: 100, height: 100))!
                let tinted = image.tinted(with: .red, blendMode: .clear)
                expect(tinted).toNot(beNil())
            }
        }
    }
}
#endif
