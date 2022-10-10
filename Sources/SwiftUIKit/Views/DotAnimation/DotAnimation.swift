//
//  DotAnimation.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2022-08-09.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import Combine
import SwiftUI

/**
 This animation can be used to render a list of dots where a
 timer increments the number of dots until the specified max
 count is reached, at which the view restarts with zero dots.

 The view just renders plain text, so you can style the text
 just like you would any other text.

 You can use the ``DotAnimationText`` view to present a text
 with the dot animation playing after the text.

 Note that something causes this view's preview to not start
 the animation. Look at ``DotAnimationText`` to see how this
 animation behaves when it's active.
 */
public struct DotAnimation: View {

    /**
     Create a dot animation.

     - Parameters:
       - dotCount: The max number of dots, by default `3`.
       - interval: The timer tick interval in seconds, by default `0.8`.
     */
    public init(
        dotCount: Int = 3,
        interval: Double = 0.8
    ) {
        self.dotCount = dotCount
        self.timer = Timer.publish(every: interval, on: .main, in: .common)
            .autoconnect()
    }

    private let dotCount: Int
    private let timer: Publishers.Autoconnect<Timer.TimerPublisher>

    @State
    private var currentDotCount = 0

    public var body: some View {
        Text(dotText)
            .onReceive(timer) { _ in increaseDotCount() }
    }
}

private extension DotAnimation {

    var dotText: String {
        if currentDotCount == 0 {
            return ""
        }
        return (0..<currentDotCount)
            .map { _ in "." }
            .joined(separator: "")
    }
}

private extension DotAnimation {

    func increaseDotCount() {
        var newCount = currentDotCount + 1
        if newCount > dotCount {
            newCount = 0
        }
        currentDotCount = newCount
    }
}

struct DotAnimation_Previews: PreviewProvider {

    static var previews: some View {
        DotAnimation()
    }
}
