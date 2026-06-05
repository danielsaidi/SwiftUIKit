//
//  View+Autosave.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2021-09-02.
//  Copyright © 2020-2026 Daniel Saidi. All rights reserved.
//

import Combine
import SwiftUI

public extension View {
    
    /// This modifier can be applied to a view, to autosave.
    ///
    /// This will call the provided action when the provided
    /// publisher changes.
    func autosave<T>(
        _ obj: Published<T>.Publisher,
        debounceInterval: RunLoop.SchedulerTimeType.Stride = 2,
        action: @escaping () -> Void
    ) -> some View {
        self.onReceive(obj.debounce(for: debounceInterval, scheduler: RunLoop.main)) { _ in
            action()
        }
    }
}
