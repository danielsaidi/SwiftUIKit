//
//  FlipView.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-01-05.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI

/**
 This view has a front and a back view and can be flipped to
 show the other side when it's tapped, swiped or both.
 
 For now, it only supports horizontal flip, since flipping a
 view both horizontally and vertically can mess it up and is
 not good from a usability point of view, since the view can
 become upside down.
 */
public struct FlipView<FrontView: View, BackView: View>: View {
    
    #if os(tvOS)
    public init(
        front: FrontView,
        back: BackView,
        isFlipped: Binding<Bool>,
        flipDuration: Double = 0.3,
        tapDirection: FlipDirection = .right
    ) {
        self.front = front
        self.back = back
        self._isFlipped = isFlipped
        self.flipDuration = flipDuration
        self.tapDirection = tapDirection
        self.swipeDirections = []
    }
    #else
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
    }
    #endif
    
    @Binding private var isFlipped: Bool
    
    private let front: FrontView
    private let back: BackView
    private let flipDuration: Double
    private let swipeDirections: [FlipDirection]
    private let tapDirection: FlipDirection
    
    @State
    private var cardRotation = 0.0

    @State
    private var contentRotation = 0.0

    @State
    private var lastDirection = FlipDirection.right
    
    public var body: some View {
        content
            .withTapGesture { flip(tapDirection) }
            .withSwipeGesture(action: swipe)
            .rotationEffect(.degrees(contentRotation), direction: tapDirection)
            .rotationEffect(.degrees(cardRotation), direction: tapDirection)
            .accessibility(addTraits: .isButton)
    }
}

private extension View {
    
    typealias FlipAction = (FlipDirection) -> Void
    
    func withTapGesture(action: @escaping () -> Void) -> some View {
        #if os(tvOS)
        Button(action: action) { self }
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
    
    var content: some View {
        ZStack {
            if isFlipped {
                back
            } else {
                front
            }
        }
    }

    var cardAnimation: Animation {
        .linear(duration: flipDuration)
    }
    
    var contentAnimation: Animation {
        .linear(duration: 0.001).delay(flipDuration/2)
    }
    
    func flip(_ direction: FlipDirection) {
        let degrees = flipDegrees(for: direction)
        withAnimation(cardAnimation) {
            cardRotation += degrees
        }
        withAnimation(contentAnimation) {
            contentRotation += degrees
            isFlipped.toggle()
        }
    }
    
    func flipDegrees(for direction: FlipDirection) -> Double {
        switch direction {
        case .right, .up: return 180
        case .left, .down: return -180
        }
    }
    
    func swipe(_ direction: FlipDirection) {
        guard swipeDirections.contains(direction) else { return }
        flip(direction)
    }
}

private extension View {
    
    @ViewBuilder
    func rotationEffect(_ angles: Angle, direction: FlipDirection) -> some View {
        switch direction {
        case .left, .right: self.rotation3DEffect(angles, axis: (x: 0, y: 1, z: 0))
        case .up, .down: self.rotation3DEffect(angles, axis: (x: 1, y: 0, z: 0))
        }
    }
}


struct FlippableView_Previews: PreviewProvider {
    
    struct Preview: View {
        
        @State private var isFlipped = false
        
        var body: some View {
            #if os(tvOS)
            FlipView(
                front: Color.green,
                back: Color.red,
                isFlipped: $isFlipped,
                flipDuration: 0.5,
                tapDirection: .right)
            #else
            FlipView(
                front: Color.green,
                back: Color.red,
                isFlipped: $isFlipped,
                flipDuration: 0.5,
                tapDirection: .right,
                swipeDirections: [.left, .right, .up, .down])
            #endif
        }
    }
    
    static var previews: some View {
        Preview()
    }
}
