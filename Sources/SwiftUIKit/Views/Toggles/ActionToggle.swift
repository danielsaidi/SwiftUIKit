import SwiftUI

/**
 This toggle can be used to perform specific actions when it
 is toggled on and off, instead of affecting the binding.

 This toggle is initialized with the provided `isOn` binding,
 but since it will not affect the value, changing this value
 should be a side-effect of the triggered actions.
 */
@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
public struct ActionToggle<Label: View>: View {

    /**
     Create an action toggle with a custom label view.

     - Parameters:
       - isOn: The value to bind the toggle to.
       - label: The toggle label.
       - onAction: The action to trigger when toggling on.
       - offAction: The action to trigger when toggling off.
     */
    public init(
        isOn: Binding<Bool>,
        label: @escaping LabelBuilder,
        onAction: @escaping () -> Void,
        offAction: @escaping () -> Void
    ) {
        self.label = label
        self.onAction = onAction
        self.offAction = offAction
        let state = ActionToggleState(isOn: isOn.wrappedValue)
        self._state = StateObject(wrappedValue: state)
        self._isOn = isOn
    }

    public typealias LabelBuilder = () -> Label

    @Binding
    private var isOn: Bool

    private var label: LabelBuilder
    private var onAction: () -> Void
    private var offAction: () -> Void

    @StateObject
    private var state: ActionToggleState

    public var body: some View {
        toggle
            .onChange(of: isOn, perform: state.syncState)
            .onReceive(state.$isOnToggleOn) { newValue in
                if state.isOnToggleDisabledBySyncState {
                    return state.isOnToggleDisabledBySyncState = false
                }
                guard newValue else { return }
                onAction()
                state.syncState(for: !state.isOnToggleOn)
            }
            .onReceive(state.$isOffToggleOn) { newValue in
                if state.isOffToggleDisabledBySyncState {
                    return state.isOffToggleDisabledBySyncState = false
                }
                guard !newValue else { return }
                offAction()
                state.syncState(for: !state.isOffToggleOn)
            }
    }
}


@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
public extension ActionToggle where Label == Text {

    /**
     Create an action toggle with a text-based label view.

     - Parameters:
       - text: The toggle text.
       - isOn: The value to bind the toggle to.
       - onAction: The action to trigger when toggling on.
       - offAction: The action to trigger when toggling off.
     */
    init(
        _ text: String,
        isOn: Binding<Bool>,
        onAction: @escaping () -> Void,
        offAction: @escaping () -> Void
    ) {
        self.init(
            isOn: isOn,
            label: { Text(text) },
            onAction: onAction,
            offAction: offAction
        )
    }
}


@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
private extension ActionToggle {

    @ViewBuilder
    var toggle: some View {
        Toggle(isOn: isOn ? $state.isOffToggleOn.animation()
               : $state.isOnToggleOn.animation(), label: label)
    }
}


@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
struct ActionToggle_Previews: PreviewProvider {

    /**
     In this preview, we use an action toggle to just toggle
     off a boolean binding off, but present a sheet where we
     can toggle it on.
     */
    struct Preview: View {

        @State
        private var isOn = true

        @State
        private var isSheetActive = false

        var body: some View {
            VStack {
                ActionToggle("Feature", isOn: $isOn) {
                    isSheetActive = true
                } offAction: {
                    isOn = false
                }
                Button("Show sheet") {
                    isSheetActive = true
                }
            }
            .sheet(isPresented: $isSheetActive) { PreviewSheet(isOn: $isOn) }
        }
    }

    struct PreviewSheet: View {

        @Binding
        var isOn: Bool

        var body: some View {
            Toggle(isOn: $isOn) {
                Text("Toggle it on")
            }
        }
    }

    static var previews: some View {
        Preview()
    }
}
