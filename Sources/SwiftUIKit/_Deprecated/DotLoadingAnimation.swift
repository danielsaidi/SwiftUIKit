//
//  DotLoadingAnimation.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2022-08-09.
//  Copyright © 2019-2025 Daniel Saidi. All rights reserved.
//

import Combine
import SwiftUI

@available(*, deprecated, message: "Use SF Symbols instead. See https://danielsaidi.com/blog/2025/06/19/creating-amazing-loading-animations-with-sf-symbols for more information.")
public struct DotLoadingAnimation: View {

    /// Create a dot animation.
    ///
    /// - Parameters:
    ///   - dotCount: The max number of dots, by default `3`.
    ///   - interval: The timer tick interval in seconds, by default `0.8`.
    public init(
        dotCount: Int = 3,
        interval: Double = 0.25
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

    private var dotText: String {
        if currentDotCount == 0 {
            return ""
        }
        return (0..<currentDotCount)
            .map { _ in "." }
            .joined(separator: "")
    }

    private func increaseDotCount() {
        var newCount = currentDotCount + 1
        if newCount > dotCount {
            newCount = 0
        }
        currentDotCount = newCount
    }
}
