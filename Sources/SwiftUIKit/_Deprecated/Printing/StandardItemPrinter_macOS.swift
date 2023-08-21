#if os(macOS)
import AppKit
import PDFKit

@available(*, deprecated, message: "This has been moved to https://github.com/danielsaidi/printingkit.")
public class StandardItemPrinter: ItemPrinter {
    
    public init() {}

    public func canPrint(_ item: PrintableItem) -> Bool {
        switch item {
        case .pdf: return true
        }
    }
    
    public func printItem(_ item: PrintableItem) {
        switch item {
        case .pdf(let url): printPdf(at: url)
        }
    }
}

@available(*, deprecated, message: "This has been moved to https://github.com/danielsaidi/printingkit.")
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
