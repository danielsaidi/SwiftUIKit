//
//  ItemPrintingView.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2022-04-04.
//  Copyright © 2022 Daniel Saidi. All rights reserved.
//

import SwiftUI

/**
 This protocol can be implemented by any view that should be
 able to print printable items.
 
 Examples of printable items are strings, attributed strings,
 images, urls that refer to files with printable content etc.
 */
public protocol ItemPrintingView: View {}

public extension ItemPrintingView {
    
    /**
     Print a printable item.
     
     - Parameters:
       - items: The items to print.
       - printable: The printable to use, by default a standard printer.
     */
    func printItem(
        _ item: PrintableItem,
        with printer: ItemPrinter = StandardItemPrinter()) {
        printer.printItem(item)
    }
}
