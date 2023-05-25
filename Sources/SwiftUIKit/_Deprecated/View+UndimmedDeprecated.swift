import SwiftUI

@available(iOS 16.0, *)
@available(*, deprecated, renamed: "PresentationDetentReference")
public typealias UndimmedPresentationDetent = PresentationDetentReference

@available(iOS 16.0, *)
public extension View {
    
    @available(*, deprecated, renamed: "presentationDetents(undimmed:dimmed:selection:)")
    func presentationDetents(
        undimmed detents: [PresentationDetentReference],
        largestUndimmed: PresentationDetentReference,
        selection: Binding<PresentationDetent>? = nil
    ) -> some View {
        self.modifier(
            PresentationDetentsViewModifier(
                presentationDetents: detents,
                largestUndimmed: largestUndimmed,
                selection: selection
            )
        )
    }

    @available(*, deprecated, message: "Use presentationDetents(:largestUndimmed:selection) instead.")
    func presentationDetents(
        undimmed: [PresentationDetentReference],
        dimmed: [PresentationDetentReference] = [],
        selection: Binding<PresentationDetent>? = nil
    ) -> some View {
        self.modifier(
            PresentationDetentsViewModifier(
                presentationDetents: undimmed + dimmed,
                largestUndimmed: undimmed.last ?? .large,
                selection: selection
            )
        )
    }
}
