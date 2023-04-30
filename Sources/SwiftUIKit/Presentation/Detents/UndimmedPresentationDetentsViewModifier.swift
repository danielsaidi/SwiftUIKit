//
//  UndimmedPresentationDetentsViewModifier.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2022-06-21.
//  Copyright © 2022 Daniel Saidi. All rights reserved.
//

#if os(iOS) && compiler(>=5.7)
import SwiftUI

/**
 This view modifier applies undimmed presentation detents to
 any view, which can be used to describe which sheet detents
 that should be undimmed.
 */
@available(iOS 16.0, *)
public struct UndimmedPresentationDetentsViewModifier: ViewModifier {

    init(
        undimmedDetents: [UndimmedPresentationDetent],
        largestUndimmed: UndimmedPresentationDetent? = nil,
        selection: Binding<PresentationDetent>? = nil
    ) {
        self.undimmedDetents = undimmedDetents
        self.largestUndimmed = largestUndimmed
        self.selection = selection
    }

    private let undimmedDetents: [UndimmedPresentationDetent]
    private let largestUndimmed: UndimmedPresentationDetent?
    private let selection: Binding<PresentationDetent>?

    public func body(content: Content) -> some View {
        if let selection = selection {
            content
                .background(background)
                .presentationDetents(
                    Set(undimmedDetents.swiftUISet),
                    selection: selection)
        } else {
            content
                .background(background)
                .presentationDetents(undimmedDetents.swiftUISet)
        }
    }
}

@available(iOS 16.0, *)
private extension UndimmedPresentationDetentsViewModifier {

    var background: some View {
        UndimmedDetentView(
            largestUndimmed: largestUndimmed ?? undimmedDetents.last
        )
    }
}

@available(iOS 16.0, *)
public extension View {

    /**
     Define a set of presentation detents that don't dim any
     underlying views when this view is presented as a sheet.

     Make sure that, if specified, `dimmed` only has detents
     than are larger than the ones in `undimmed`.

     - Parameters:
       - undimmed: The undimmed detents to enable for the view.
       - dimmed: The dimmed detents to enable for the view.
       - selection: An external selection binding.
     */
    func presentationDetents(
        undimmed: [UndimmedPresentationDetent],
        dimmed: [UndimmedPresentationDetent] = [],
        selection: Binding<PresentationDetent>? = nil
    ) -> some View {
        self.modifier(
            UndimmedPresentationDetentsViewModifier(
                undimmedDetents: undimmed + dimmed,
                largestUndimmed: undimmed.last,
                selection: selection
            )
        )
    }
}

@available(iOS 16.0, *)
private struct UndimmedDetentView: UIViewControllerRepresentable {

    var largestUndimmed: UndimmedPresentationDetent?

    func makeUIViewController(context: Context) -> UIViewController {
        let result = UndimmedDetentController()
        result.largestUndimmedDetent = largestUndimmed
        return result
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
    }
}

@available(iOS 16.0, *)
private class UndimmedDetentController: UIViewController {

    var largestUndimmedDetent: UndimmedPresentationDetent?

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
}

@available(iOS 16.0, *)
struct View_PresentationDetents_Previews: PreviewProvider {

    struct Preview: View {

        @State
        private var isPresented = false

        var body: some View {
            Color.green.ignoresSafeArea()
                .overlay(button)
                .sheet(isPresented: $isPresented) {
                    Color.red.ignoresSafeArea()
                        .presentationDetents(
                            undimmed: [
                                .fraction(0.3),
                                .fraction(0.5),
                                .height(500)
                            ],
                            largestUndimmed: .fraction(0.5)
                        )
                }
        }

        var button: some View {
            Button("Toggle sheet") {
                isPresented.toggle()
            }.buttonStyle(.borderedProminent)
        }
    }

    static var previews: some View {
        Preview()
    }
}
#endif
