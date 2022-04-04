//
//  StandardItemPrinter.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2022-04-07.
//  Copyright © 2022 Daniel Saidi. All rights reserved.
//

#if os(macOS)
import AppKit
import PDFKit

/**
 This class implements the ``ItemPrinter`` protocol by using
 a `AppKit` to print items.
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
        switch item {
        case .pdf(let url): printPdf(at: url)
        }
    }
}

private extension StandardItemPrinter {
    
    func printPdf(at url: URL) {
        let view = PDFView()
        let window = NSWindow()
        view.document = PDFDocument(url: url)
        window.setContentSize(view.frame.size)
        window.contentView = view
        window.center()
        view.print(with: .shared, autoRotate: true)
    }
}
#endif
