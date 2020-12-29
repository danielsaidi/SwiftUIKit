//
//  FlippableView.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-01-05.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

#if os(iOS)
import SwiftUI

/**
 This view has a front and a back view and can be flipped to
 show the other side when it's tapped, swiped or both.
 
 For now, it only supports horizontal flip, since flipping a
 view both horizontally and vertically can mess it up and is
 not good from a usability point of view, since the view can
 become upside down.
 */
public struct FlippableView<Front: View, Back: View>: View {
    
    public init(
        front: Front,
        back: Back,
        isTapEnabled: Bool = true,
        isSwipeEnabled: Bool = true) {
        self.front = front
        self.back = back
        self.isTapEnabled = isTapEnabled
        self.isSwipeEnabled = isSwipeEnabled
    }
    
    private let front: Front
    private let back: Back
    private let isTapEnabled: Bool
    private let isSwipeEnabled: Bool
    
    private let flipDegrees = 180.0
    
    @State private var isFlipped = false
    @State private var isFlippedWithTap = false
    @State private var yDegrees: Double = 0
    @State private var xDegrees: Double = 0
    
    public enum FlipDirection {
        case left, right, up, down
    }

    public var body: some View {
        VStack {
            Spacer()
            ZStack {
                front.flipRotateY(degrees: yDegrees)
                    .opacity(isFlipped ? 0.0 : 1.0)
                back.flipRotateY(degrees: -180 + yDegrees)
                    .opacity(isFlipped ? 1.0 : 0.0)
            }
            .animation(.easeInOut(duration: 0.5))
            .onSwipeGesture(
                left: flipWithSwipeLeft,
                right: flipWithSwipeRight)
            .onTapGesture(perform: flipWithTap)
            Spacer()
        }
    }
}

private extension FlippableView {
    
    func flip(_ direction: FlipDirection) {
        isFlipped.toggle()
        let degrees = flipDegrees * multiplier(for: direction)
        switch direction {
        case .left, .right: yDegrees += degrees
        default: break
        }
    }
    
    func flipWithSwipeLeft() {
        guard isSwipeEnabled else { return }
        isFlippedWithTap = false
        flip(.left)
    }
    
    func flipWithSwipeRight() {
        guard isSwipeEnabled else { return }
        isFlippedWithTap = false
        flip(.right)
    }
    
    func flipWithTap() {
        guard isTapEnabled else { return }
        flip(isFlippedWithTap ? .left : .right)
        isFlippedWithTap.toggle()
    }
    
    func multiplier(for direction: FlipDirection) -> Double {
        switch direction {
        case .up, .right: return 1
        case .down, .left: return -1
        }
    }
}

private extension View {
    
    func flipRotateX(degrees: Double) -> some View {
        flipRotate(x: 1, degrees: degrees)
    }
    
    func flipRotateY(degrees: Double) -> some View {
        flipRotate(y: 1, degrees: degrees)
    }
    
    func flipRotate(x: CGFloat = 0, y: CGFloat = 0, degrees: Double) -> some View {
        rotation3DEffect(Angle(degrees: degrees), axis: (x: x, y: y, z: 0.0))
    }
}
#endif
