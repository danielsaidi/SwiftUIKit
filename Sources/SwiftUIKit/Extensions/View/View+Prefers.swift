//
//  View+PersistentSystemOverlays.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2022-08-01.
//  Copyright © 2022-2023 Daniel Saidi. All rights reserved.
//

import SwiftUI

/**
 This extension provides extensions that apply view modifier
 behavior only if the runtime platform supports it.
 */
public extension View {

    /**
     Applies `.menuOrder(.fixed)`.

     The modifier will only be applied on iOS 16.0 and later,
     as well as macOS 13.0, tvOS 16.0 and watchOS 9.0.
     */
    @ViewBuilder
    func prefersMenuOrderFixed() -> some View {
        if #available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *) {
            self.menuOrder(.fixed)
        } else {
            self
        }
    }

    /**
     Applies `.persistentSystemOverlays(.hidden)`.

     The modifier will only be applied on iOS 16.0 and later,
     as well as macOS 13.0, tvOS 16.0 and watchOS 9.0.
     */
    @ViewBuilder
    func prefersPersistentSystemOverlaysHidden() -> some View {
        if #available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *) {
            self.persistentSystemOverlays(.hidden)
        } else {
            self
        }
    }
}

struct View_PersistentSystemOverlays_Previews: PreviewProvider {

    static var previews: some View {
        VStack {
            #if os(iOS) || os(macOS)
            Menu("Test") {
                Button("1") {}
                Button("2") {}
            }.prefersMenuOrderFixed()
            #endif
        }.prefersPersistentSystemOverlaysHidden()
    }
}
