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
        self.presentationDetents(detents)
            .background(UndimmedDetentView())
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
        self.presentationDetents(detents, selection: selection)
            .background(UndimmedDetentView())
    }
}

@available(iOS 16.0, *)
private struct UndimmedDetentView: UIViewControllerRepresentable {

    var largestUndimmedDetent: PresentationDetent?

    func makeUIViewController(context: Context) -> UIViewController {
        UndimmedDetentController(rootView: Color.clear)
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
    }
}

@available(iOS 16.0, *)
private class UndimmedDetentController<Content: View>: UIHostingController<Content> {

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        sheetPresentationController?.largestUndimmedDetentIdentifier = .large
        parent?.presentingViewController?.view.tintAdjustmentMode = .normal
    }
}
#endif
