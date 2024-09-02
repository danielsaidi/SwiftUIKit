//
//  GestureButton.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2022-11-24.
//  Copyright © 2022-2024 Daniel Saidi. All rights reserved.
//

#if os(iOS) || os(macOS) || os(watchOS)
import SwiftUI

@available(*, deprecated, message: "This has moved to https://github.com/danielsaidi/GestureButton")
public struct GestureButton<Label: View>: View {

    /// Create a gesture button.
    ///
    /// - Parameters:
    ///   - isPressed: The binding used to track pressed state, if any.
    ///   - pressAction: An action to trigger when the button is pressed, if any.
    ///   - releaseInsideAction: An action to trigger when the button is released inside, if any.
    ///   - releaseOutsideAction: An action to trigger when the button is released outside, if any.
    ///   - longPressDelay: The time it takes for a press to count as a long press, by default ``GestureButtonDefaults/longPressDelay``.
    ///   - longPressAction: An action to trigger when the button is long pressed, if any.
    ///   - doubleTapTimeout: The max time between two taps to count as a double tap, by default ``GestureButtonDefaults/doubleTapTimeout``.
    ///   - doubleTapAction: An action to trigger when the button is double tapped, if any.
    ///   - repeatDelay: The time it takes for a press to count as a repeat trigger, by default ``GestureButtonDefaults/repeatDelay``.
    ///   - repeatTimer: The repeat timer to use for the repeat action, by default ``RepeatGestureTimer/shared``.
    ///   - repeatAction: An action to repeat while the button is being pressed, if any.
    ///   - dragStartAction: An action to trigger when a drag gesture starts.
    ///   - dragAction: An action to trigger when a drag gesture changes.
    ///   - dragEndAction: An action to trigger when a drag gesture ends.
    ///   - endAction: An action to trigger when a button gesture ends, if any.
    ///   - label: The button label.
    public init(
        isPressed: Binding<Bool>? = nil,
        pressAction: Action? = nil,
        releaseInsideAction: Action? = nil,
        releaseOutsideAction: Action? = nil,
        longPressDelay: TimeInterval = GestureButtonDefaults.longPressDelay,
        longPressAction: Action? = nil,
        doubleTapTimeout: TimeInterval = GestureButtonDefaults.doubleTapTimeout,
        doubleTapAction: Action? = nil,
        repeatDelay: TimeInterval = GestureButtonDefaults.repeatDelay,
        repeatTimer: RepeatGestureTimer = .shared,
        repeatAction: Action? = nil,
        dragStartAction: DragAction? = nil,
        dragAction: DragAction? = nil,
        dragEndAction: DragAction? = nil,
        endAction: Action? = nil,
        label: @escaping LabelBuilder
    ) {
        self.isPressedBinding = isPressed ?? .constant(false)
        self.pressAction = pressAction
        self.releaseInsideAction = releaseInsideAction
        self.releaseOutsideAction = releaseOutsideAction
        self.longPressDelay = longPressDelay
        self.longPressAction = longPressAction
        self.doubleTapTimeout = doubleTapTimeout
        self.doubleTapAction = doubleTapAction
        self.repeatDelay = repeatDelay
        self.repeatTimer = repeatTimer
        self.repeatAction = repeatAction
        self.dragStartAction = dragStartAction
        self.dragAction = dragAction
        self.dragEndAction = dragEndAction
        self.endAction = endAction
        self.label = label
    }

    public typealias Action = () -> Void
    public typealias DragAction = (DragGesture.Value) -> Void
    public typealias LabelBuilder = (_ isPressed: Bool) -> Label

    var isPressedBinding: Binding<Bool>

    let pressAction: Action?
    let releaseInsideAction: Action?
    let releaseOutsideAction: Action?
    let longPressDelay: TimeInterval
    let longPressAction: Action?
    let doubleTapTimeout: TimeInterval
    let doubleTapAction: Action?
    let repeatDelay: TimeInterval
    let repeatTimer: RepeatGestureTimer
    let repeatAction: Action?
    let dragStartAction: DragAction?
    let dragAction: DragAction?
    let dragEndAction: DragAction?
    let endAction: Action?
    let label: LabelBuilder

    @State
    private var isPressed = false

    @State
    private var longPressDate = Date()

    @State
    private var releaseDate = Date()

    @State
    private var repeatDate = Date()

    public var body: some View {
        label(isPressed)
            .overlay(gestureView)
            .onChange(of: isPressed) { isPressedBinding.wrappedValue = $0 }
            .accessibilityAddTraits(.isButton)
    }
}

@available(*, deprecated, message: "This has moved.")
private extension GestureButton {

    var gestureView: some View {
        GeometryReader { geo in
            Color.clear
                .contentShape(Rectangle())
                .gesture(
                    DragGesture(minimumDistance: 0)
                        .onChanged { value in
                            tryHandlePress(value)
                            dragAction?(value)
                        }
                        .onEnded { value in
                            tryHandleRelease(value, in: geo)
                        }
                )
        }
    }
}

@available(*, deprecated, message: "This has moved.")
private extension GestureButton {

    func tryHandlePress(_ value: DragGesture.Value) {
        if isPressed { return }
        isPressed = true
        pressAction?()
        dragStartAction?(value)
        tryTriggerLongPressAfterDelay()
        tryTriggerRepeatAfterDelay()
    }

    func tryHandleRelease(_ value: DragGesture.Value, in geo: GeometryProxy) {
        if !isPressed { return }
        isPressed = false
        longPressDate = Date()
        repeatDate = Date()
        repeatTimer.stop()
        releaseDate = tryTriggerDoubleTap() ? .distantPast : Date()
        dragEndAction?(value)
        if geo.contains(value.location) {
            releaseInsideAction?()
        } else {
            releaseOutsideAction?()
        }
        endAction?()
    }

    func tryTriggerLongPressAfterDelay() {
        guard let action = longPressAction else { return }
        let date = Date()
        longPressDate = date
        let delay = longPressDelay
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            guard self.longPressDate == date else { return }
            action()
        }
    }

    func tryTriggerRepeatAfterDelay() {
        guard let action = repeatAction else { return }
        let date = Date()
        repeatDate = date
        let delay = repeatDelay
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            guard self.repeatDate == date else { return }
            repeatTimer.start(action: action)
        }
    }

    func tryTriggerDoubleTap() -> Bool {
        let interval = Date().timeIntervalSince(releaseDate)
        let isDoubleTap = interval < doubleTapTimeout
        if isDoubleTap { doubleTapAction?() }
        return isDoubleTap
    }
}

private extension GeometryProxy {

    func contains(_ dragEndLocation: CGPoint) -> Bool {
        let x = dragEndLocation.x
        let y = dragEndLocation.y
        guard x > 0, y > 0 else { return false }
        guard x < size.width, y < size.height else { return false }
        return true
    }
}
#endif
