#if os(iOS)
import UIKit

@available(*, deprecated, message: "This has been moved to https://github.com/danielsaidi/printingkit.")
public class StandardItemPrinter: ItemPrinter {
    
    public init() {}
    
    public func canPrint(_ item: PrintableItem) -> Bool {
        switch item {
        case .pdf: return true
        }
    }
    
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
