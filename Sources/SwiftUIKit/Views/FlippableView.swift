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
        tapDirection: FlipDirection? = .right,
        swipeDirections: [FlipDirection] = [.left, .right, .up, .down]) {
        self.front = front
        self.back = back
        self.tapDirection = tapDirection
        self.swipeDirections = swipeDirections
    }
    
    private let front: Front
    private let back: Back
    private let tapDirection: FlipDirection?
    private let swipeDirections: [FlipDirection]
    
    private let flipDegrees = 180.0
    
    @State private var isFlipped = false
    @State private var yDegrees: Double = 0
    @State private var xDegrees: Double = 0
    
    public enum FlipDirection {
        case left, right, up, down
    }

    public var body: some View {
        VStack {
            Spacer()
            ZStack {
                front
                    .flipRotateX(degrees: xDegrees)
                    .flipRotateY(degrees: yDegrees)
                    .opacity(isFlipped ? 0 : 1)
                back.flipRotateX(degrees: 180 + xDegrees)
                    .flipRotateY(degrees: 0 + yDegrees)
                    .opacity(isFlipped ? 1 : 0)
            }
            .animation(.easeInOut(duration: 0.5))
            .onSwipeGesture(
                up: { flip(.up) },
                left: { flip(.left) },
                right: { flip(.right) },
                down: { flip(.down) })
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
        case .up, .down: xDegrees += degrees
        case .left, .right: yDegrees += degrees
        }
    }
    
    func flipWithSwipe(_ direction: FlipDirection) {
        guard swipeDirections.contains(direction) else { return }
        flip(direction)
    }
    
    func flipWithTap() {
        guard let direction = tapDirection else { return }
        flip(direction)
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
    
    func flipRotateZ(degrees: Double) -> some View {
        flipRotate(z: 1, degrees: degrees)
    }
    
    func flipRotate(x: CGFloat = 0, y: CGFloat = 0, z: CGFloat = 0, degrees: Double) -> some View {
        rotation3DEffect(Angle(degrees: degrees), axis: (x: x, y: y, z: z))
    }
}


struct FlippableView_Previews: PreviewProvider {
    
    static var front: some View {
        Color.green.overlay(Text("Front").rotated())
    }
    
    static var back: some View {
        Color.red.overlay(Text("Back").rotated())
    }
    
    static var previews: some View {
        FlippableView(front: front, back: back)
    }
}

private extension Text {
    
    func rotated() -> some View {
        self.rotation3DEffect(
            .degrees(90),
            axis: (x: 0, y: 0, z: 1.0)
        )
    }
}
#endif
