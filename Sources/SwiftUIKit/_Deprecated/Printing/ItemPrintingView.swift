import SwiftUI

@available(*, deprecated, message: "This has been moved to https://github.com/danielsaidi/printingkit.")
public protocol ItemPrintingView: View {}

@available(*, deprecated, message: "This has been moved to https://github.com/danielsaidi/printingkit.")
public extension ItemPrintingView {

    func printItem(
        _ item: PrintableItem,
        with printer: ItemPrinter = StandardItemPrinter()) {
        printer.printItem(item)
    }
}
