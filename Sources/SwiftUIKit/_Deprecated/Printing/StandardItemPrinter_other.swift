#if os(tvOS) || os(watchOS)

@available(*, deprecated, message: "This has been moved to https://github.com/danielsaidi/printingkit.")
public class StandardItemPrinter: ItemPrinter {
    
    public init() {}
    
    public func canPrint(_ item: PrintableItem) -> Bool { false }
    
    public func printItem(_ item: PrintableItem) {
        print("Printing is not supported on this platform.")
    }
}
#endif
