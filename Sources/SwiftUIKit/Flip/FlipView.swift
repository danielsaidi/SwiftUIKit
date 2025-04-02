//
//  FlipView.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-01-05.
//  Copyright © 2020-2025 Daniel Saidi. All rights reserved.
//

import SwiftUI

/// This view has a front and a back view and can be flipped
/// to show the other side when it's tapped, swiped, or both.
///
/// For now, this view only supports horizontal flips, since
/// flipping views both horizontally and vertically can mess
/// it up, since the view can become upside down.
public struct FlipView<FrontView: View, BackView: View>: View {
    
    public init(
        front: FrontView,
        back: BackView,
        isFlipped: Binding<Bool>,
        flipDuration: Double = 0.3,
        tapDirection: FlipDirection = .right,
        swipeDirections: [FlipDirection] = [.left, .right]
    ) {
        self.front = front
        self.back = back
        self._isFlipped = isFlipped
        self.flipDuration = flipDuration
        self.tapDirection = tapDirection
        self.swipeDirections = swipeDirections
        
        let isFlippedValue = isFlipped.wrappedValue
        self._isContentFlipped = .init(initialValue: isFlippedValue)
    }
    
    @Binding private var isFlipped: Bool
    
    private let front: FrontView
    private let back: BackView
    private let flipDuration: Double
    private let swipeDirections: [FlipDirection]
    private let tapDirection: FlipDirection

    @State private var cardRotation = 0.0
    @State private var contentRotation = 0.0
    @State private var isContentFlipped: Bool {
        didSet { isFlipped = isContentFlipped }
    }
    @State private var isFlipping = false
    @State private var lastDirection = FlipDirection.right
    
    public var body: some View {
        bodyContent
            .onChange(of: isFlipped, perform: { _ in flipWithTap() })
            .withTapGesture(action: flipWithTap)
            .withSwipeGesture(action: flipWithSwipe)
            .rotationEffect(.degrees(contentRotation), direction: lastDirection)
            .rotationEffect(.degrees(cardRotation), direction: lastDirection)
            .accessibility(addTraits: .isButton)
    }
    
    @ViewBuilder
    var bodyContent: some View {
        if isContentFlipped {
            back
        } else {
            front
        }
    }
}

private extension View {
    
    typealias FlipAction = (FlipDirection) -> Void
    
    func withTapGesture(action: @escaping () -> Void) -> some View {
        #if os(tvOS)
        Button(action: action) { self }
            .buttonStyle(.plain)
        #else
        self.onTapGesture(perform: action)
        #endif
    }
    
    func withSwipeGesture(action: @escaping FlipAction) -> some View {
        #if os(tvOS)
        self
        #else
        self.onSwipeGesture(
            up: { action(.up) },
            left: { action(.left) },
            right: { action(.right) },
            down: { action(.down) })
        #endif
    }
}

private extension FlipView {
    
    func flip(_ direction: FlipDirection) {
        guard !isFlipping else { return }
        isFlipping = true
        lastDirection = direction
        cardRotation = isContentFlipped ? 180 : 0
        contentRotation = isContentFlipped ? 180 : 0
        
        let degrees = flipDegrees(for: direction)
        if #available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *) {
            withAnimation(.linear(duration: flipDuration/2)) {
                cardRotation += degrees/2
            } completion: {
                contentRotation += degrees
                isContentFlipped.toggle()
                withAnimation(.linear(duration: flipDuration/2)) {
                    cardRotation += degrees/2
                } completion: {
                    isFlipping = false
                }
            }
        } else {
            withAnimation(.linear(duration: flipDuration)) {
                cardRotation += degrees
            }
            withAnimation(.linear(duration: 0.001).delay(flipDuration/2)) {
                contentRotation += degrees
                isContentFlipped.toggle()
                isFlipping = false
            }
        }
    }
    
    func flipDegrees(for direction: FlipDirection) -> Double {
        switch direction {
        case .right, .up: 180
        case .left, .down: -180
        }
    }
    
    func flipWithTap() {
        flip(tapDirection)
    }
    
    func flipWithSwipe(in direction: FlipDirection) {
        guard swipeDirections.contains(direction) else { return }
        flip(direction)
    }
}

private extension View {
    
    @ViewBuilder
    func rotationEffect(
        _ angles: Angle,
        direction: FlipDirection
    ) -> some View {
        switch direction {
        case .left, .right: rotation3DEffect(angles, axis: (x: 0, y: 1, z: 0))
        case .up, .down: rotation3DEffect(angles, axis: (x: 1, y: 0, z: 0))
        }
    }
}

@MainActor
@ViewBuilder
func previewContent(isFlipped: Binding<Bool>) -> some View {
    Text("Is Flipped: \(isFlipped.wrappedValue)")
    
    FlipView(
        front: Color.green.overlay(Text("Front")),
        back: Color.red.overlay(Text("Back")),
        isFlipped: isFlipped,
        flipDuration: 0.5,
        tapDirection: .right,
        swipeDirections: [.left, .right, .up, .down]
    )
    .cornerRadius(10)
    .shadow(radius: 0, x: 0, y: 2)
    
    Button("Flip") {
        withAnimation {
            isFlipped.wrappedValue.toggle()
        }
    }
}

#Preview("Stack") {
    
    struct Preview: View {
        
        @State
        private var isFlipped = false
        
        var body: some View {
            VStack {
                previewContent(isFlipped: $isFlipped)
            }
            .padding()
        }
    }
    
    return Preview()
}

#Preview("List (BUG)") {
    
    struct Preview: View {
        
        @State
        private var isFlipped = false
        
        var body: some View {
            List {
                previewContent(isFlipped: $isFlipped)
            }
            .padding()
        }
    }
    
    return Preview()
}
