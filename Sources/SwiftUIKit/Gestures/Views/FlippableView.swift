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
 This view consists of a front and a back view, where the amd can be flipped by either tapping the view or.
 */
public struct FlippableView: View, Flippable {
    
    public init(front: AnyView, back: AnyView) {
        self.frontView = front
        self.backView = back
    }
    
    private let frontView: AnyView
    private let backView: AnyView
    
    @State private var isFlipped = false
    @State private var rotationX = 0.0
    @State private var rotationY = 0.0
    
    public func flip(_ direction: FlipDirection) {
        flipHalfways(direction: direction)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            self.isFlipped.toggle()
            self.flipHalfways(direction: direction)
        }
    }
    
    public func flipHalfways(direction: FlipDirection) {
        withAnimation {
            switch direction {
            case .left: self.rotationY -= 90
            case .right: self.rotationY += 90
            case .up: self.rotationX += 90
            case .down: self.rotationX -= 90
            }
        }
    }
    
    public var body: some View {
        content
            .rotation3DEffect(Angle(degrees: self.rotationX), axis: (x: 1, y: 0, z: 0))
            .rotation3DEffect(Angle(degrees: self.rotationY), axis: (x: 0, y: 1, z: 0))
            .onSwipeGesture(
                up: { self.flip(.up) },
                left: { self.flip(.left) },
                right: { self.flip(.right) },
                down: { self.flip(.down) }
            )
            .onTapGesture { self.flip(.right) }
    }
    
    @ViewBuilder
    private var content: some View {
        isFlipped ? backView : frontView
    }
}
#endif
