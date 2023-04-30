import SwiftUI

@available(iOS 16.0, *)
public extension View {
    
    @available(*, deprecated, renamed: "presentationDetents(undimmed:dimmed:selection:)")
    func presentationDetents(
        undimmed detents: [UndimmedPresentationDetent],
        largestUndimmed: UndimmedPresentationDetent? = nil,
        selection: Binding<PresentationDetent>? = nil
    ) -> some View {
        self.modifier(
            UndimmedPresentationDetentsViewModifier(
                undimmedDetents: detents,
                largestUndimmed: largestUndimmed,
                selection: selection
            )
        )
    }
}
