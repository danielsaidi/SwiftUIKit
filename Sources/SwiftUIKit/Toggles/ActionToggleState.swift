import SwiftUI

/**
 This private class is used by the ``ActionToggle``.
 */
final class ActionToggleState: ObservableObject {

    init(isOn: Bool) {
        self.isOnToggleOn = isOn
        self.isOffToggleOn = isOn
        self.isOnToggleDisabledBySyncState = true
        self.isOffToggleDisabledBySyncState = true
    }

    @Published
    var isOnToggleOn: Bool

    @Published
    var isOffToggleOn: Bool

    var isOnToggleDisabledBySyncState: Bool

    var isOffToggleDisabledBySyncState: Bool
}

extension ActionToggleState {

    func syncState(for isOn: Bool) {
        isOnToggleDisabledBySyncState = true
        isOffToggleDisabledBySyncState = true
        isOnToggleOn = isOn
        isOffToggleOn = isOn
    }
}
