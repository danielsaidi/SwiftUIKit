//
//  StandardItemPrinter.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2022-04-04.
//  Copyright © 2022 Daniel Saidi. All rights reserved.
//

#if os(iOS)
import UIKit

/**
 This class implements the ``ItemPrinter`` protocol by using
 a `UIPrintInteractionController` to print items.
 */
public class StandardItemPrinter: ItemPrinter {
    
    public init() {}
    
    /**
     Whether or not the printer can print a certain item.
     
     - Parameters:
       - item: The item to print.
     */
    public func canPrint(_ item: PrintableItem) -> Bool {
        return true
    }
    
    /**
     Print a list of printable items.
     
     - Parameters:
       - item: The item to print.
     */
    public func printItem(_ item: PrintableItem) {
        let printInfo = UIPrintInfo(dictionary: nil)
        printInfo.outputType = .general
        printInfo.jobName = "Standard Print Job"
        let controller = UIPrintInteractionController.shared
        controller.printInfo = printInfo
        controller.printingItem = item
        controller.present(animated: true)
    }
}
#endif
