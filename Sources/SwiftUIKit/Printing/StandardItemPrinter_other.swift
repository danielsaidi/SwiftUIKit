//
//  StandardItemPrinter.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2022-04-07.
//  Copyright © 2022 Daniel Saidi. All rights reserved.
//

#if os(tvOS) || os(watchOS)

/**
 This class implements the ``ItemPrinter`` protocol when the
 platform doesn't support printing.

 The printer will just output a text that informs about that
 printing is not supported on the platform.
 */
public class StandardItemPrinter: ItemPrinter {
    
    public init() {}
    
    /**
     Whether or not the printer can print a certain item.
     
     - Parameters:
       - item: The item to print.
     */
    public func canPrint(_ item: PrintableItem) -> Bool {
        return false
    }
    
    /**
     Print a list of printable items.
     
     - Parameters:
       - item: The item to print.
     */
    public func printItem(_ item: PrintableItem) {
        print("Printing is not supported on this platform.")
    }
}
#endif
