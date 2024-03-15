//
//  UndimmedPresentationDetentsViewModifier.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2022-06-21.
//  Copyright © 2022-2024 Daniel Saidi. All rights reserved.
//

#if os(iOS) && compiler(>=5.7)
import SwiftUI

/**
 This view modifier applies undimmed presentation detents to
 any view, which can be used to describe which sheet detents
 that should be undimmed.
 */
@available(*, deprecated, message: "This has been deprecated, since SwiftUI now has native support for presentation detents.")
@available(iOS 16.0, *)
public struct PresentationDetentsViewModifier: ViewModifier {

    public init(
        presentationDetents: [PresentationDetentReference],
        largestUndimmed: PresentationDetentReference,
        selection: Binding<PresentationDetent>? = nil
    ) {
        self.presentationDetents = presentationDetents + [largestUndimmed]
        self.largestUndimmed = largestUndimmed
        self.selection = selection
    }

    private let presentationDetents: [PresentationDetentReference]
    private let largestUndimmed: PresentationDetentReference
    private let selection: Binding<PresentationDetent>?

    public func body(content: Content) -> some View {
        if let selection = selection {
            content
                .background(background)
                .presentationDetents(
                    Set(presentationDetents.swiftUISet),
                    selection: selection)
        } else {
            content
                .background(background)
                .presentationDetents(Set(presentationDetents.swiftUISet))
        }
    }
}

@available(*, deprecated, message: "This has been deprecated, since SwiftUI now has native support for presentation detents.")
@available(iOS 16.0, *)
private extension PresentationDetentsViewModifier {

    var background: some View {
        UndimmedDetentView(
            largestUndimmed: largestUndimmed
        )
    }
}

@available(*, deprecated, message: "This has been deprecated, since SwiftUI now has native support for presentation detents.")
@available(iOS 16.0, *)
public extension View {

    /**
     Define a set of presentation detents that don't dim any
     underlying views when this view is presented as a sheet.

     - Parameters:
       - detents: The presentation detents to add to the view.
       - largestUndimmed: The largest undimmed presentation detent.
       - selection: An external detent selection binding.
     */
    func presentationDetents(
        _ detents: [PresentationDetentReference],
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
}

@available(*, deprecated, message: "This has been deprecated, since SwiftUI now has native support for presentation detents.")
@available(iOS 16.0, *)
private struct UndimmedDetentView: UIViewControllerRepresentable {

    var largestUndimmed: PresentationDetentReference?

    func makeUIViewController(context: Context) -> UndimmedDetentViewController {
        let result = UndimmedDetentViewController()
        result.largestUndimmedDetent = largestUndimmed
        return result
    }

    func updateUIViewController(_ controller: UndimmedDetentViewController, context: Context) {
        controller.largestUndimmedDetent = largestUndimmed
    }
}

@available(*, deprecated, message: "This has been deprecated, since SwiftUI now has native support for presentation detents.")
@available(iOS 16.0, *)
private class UndimmedDetentViewController: UIViewController {

    var largestUndimmedDetent: PresentationDetentReference?

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        avoidDimmingParent()
        avoidDisablingControls()
    }

    func avoidDimmingParent() {
        let id = largestUndimmedDetent?.uiKitIdentifier
        sheetPresentationController?.largestUndimmedDetentIdentifier = id
    }

    func avoidDisablingControls() {
        presentingViewController?.view.tintAdjustmentMode = .normal
    }
}#endif
