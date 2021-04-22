//
//  String+SlugifiedTests.swift
//  SwiftUIKitTests
//
//  Created by Daniel Saidi on 2021-04-22.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

import Quick
import Nimble
@testable import SwiftUIKit

class String_SlugifiedTests: QuickSpec {
    
    override func spec() {
        
        func result(for string: String) -> String {
            string.slugified()
        }
        
        describe("slugified text") {
            
            it("removes invalid characters") {
                expect(result(for: "I'd love an AppleCar!")).to(equal("i-d-love-an-applecar"))
            }
        }
    }
}
