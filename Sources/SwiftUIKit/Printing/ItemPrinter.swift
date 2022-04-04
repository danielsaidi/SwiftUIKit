//
//  ItemPrinter.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2022-04-04.
//  Copyright © 2022 Daniel Saidi. All rights reserved.
//

import Foundation

/**
 This protocol can be implemented by a type that can be used
 to print printable items.
 */
public protocol ItemPrinter {
    
    /**
     Whether or not the printer can print a certain item.
     
     - Parameters:
       - item: The item to print.
     */
    func canPrint(_ item: PrintableItem) -> Bool
    
    /**
     Print a printable item.
     
     - Parameters:
       - item: The item to print.
     */
    func printItem(_ item: PrintableItem)
}
