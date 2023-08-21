import Foundation

@available(*, deprecated, message: "This has been moved to https://github.com/danielsaidi/printingkit.")
public protocol ItemPrinter {
    
    func canPrint(_ item: PrintableItem) -> Bool
    func printItem(_ item: PrintableItem)
}
