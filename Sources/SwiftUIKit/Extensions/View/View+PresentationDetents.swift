//
//  View+PresentationDetents.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2022-06-21.
//  Copyright © 2022 Daniel Saidi. All rights reserved.
//

#if os(iOS) && compiler(>=5.7)
import SwiftUI

@available(iOS 16.0, *)
public extension View {

    /**
     Define a set of presentation detents that don't dim any
     underlying views when this view is presented as a sheet.

     - Parameters:
       - detents: The detents to enable for the view.
     */
    func presentationDetents(
        undimmed detents: Set<PresentationDetent>
    ) -> some View {
        self.background(UndimmedDetentView())
            .presentationDetents(detents.withLarge())
    }

    /**
     Define a set of presentation detents that don't dim any
     underlying views when this view is presented as a sheet.

     - Parameters:
       - detents: The detents to enable for the view.
       - selection: The pre-selected detents.
     */
    func presentationDetents(
        undimmed detents: Set<PresentationDetent>,
        selection: Binding<PresentationDetent>
    ) -> some View {
        self.background(UndimmedDetentView())
            .presentationDetents(
                detents.withLarge(),
                selection: selection
            )
    }
}

@available(iOS 16.0, *)
private extension Set where Element == PresentationDetent {

    func withLarge() -> Set<PresentationDetent> {
        var detent = self
        detent.insert(.large)
        return detent
    }
}

@available(iOS 16.0, *)
private struct UndimmedDetentView: UIViewControllerRepresentable {

    var largestUndimmedDetent: PresentationDetent?

    func makeUIViewController(context: Context) -> UIViewController {
        UndimmedDetentController()
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
    }
}

@available(iOS 16.0, *)
private class UndimmedDetentController: UIViewController {

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        avoidDimmingParent()
        avoidDisablingControls()
    }

    func avoidDimmingParent() {
        sheetPresentationController?.largestUndimmedDetentIdentifier = .large
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
                        .presentationDetents(undimmed: [
                            .fraction(0.3)
                        ])
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
