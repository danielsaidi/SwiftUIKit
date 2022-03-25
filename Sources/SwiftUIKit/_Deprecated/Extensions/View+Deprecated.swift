import SwiftUI

public extension View {
    
    @available(*, deprecated, message: "Use alert(_ context: AlertContext) instead")
    func alert(context: AlertContext) -> some View {
        alert(context)
    }
    
    @available(*, deprecated, message: "Use sheet(_ context: SheetContext) instead")
    func sheet(context: SheetContext) -> some View {
        sheet(context)
    }
    
    @available(*, deprecated, message: "Use contentShape or something else instead, to make an entire view tappable.")
    func interactable() -> some View {
        self.background(Color.clearInteractable)
    }
}

#if os(iOS) || os(tvOS) || os(watchOS)

@available(iOS 14.0, tvOS 14.0, watchOS 7.0, *)
public extension View {
    
    @available(*, deprecated, message: "Use fullScreenCover(_ context: FullScreenCoverContext) instead")
    func fullScreenCover(context: FullScreenCoverContext) -> some View {
        fullScreenCover(context)
    }
}

#endif
