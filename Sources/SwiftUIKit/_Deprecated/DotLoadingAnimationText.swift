//
//  DotLoadingAnimationText.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2022-08-09.
//  Copyright © 2019-2025 Daniel Saidi. All rights reserved.
//

import SwiftUI

@available(*, deprecated, message: "Use SF Symbols instead. See https://danielsaidi.com/blog/2025/06/19/creating-amazing-loading-animations-with-sf-symbols for more information.")
public struct DotLoadingAnimationText: View {

    /// Create a dot animation text.
    ///
    /// - Parameters:
    ///   - text: The text to present.
    ///   - bundle: The bundle of the localized text, if any.
    ///   - dotCount: The max number of dots, by default `3`.
    ///   - interval: The timer tick interval in seconds, by default `0.8`.
    public init(
        text: LocalizedStringKey,
        bundle: Bundle? = nil,
        dotCount: Int = 3,
        interval: Double = 0.8
    ) {
        self.text = text
        self.bundle = bundle
        self.dotCount = dotCount
        self.interval = interval
    }

    private let text: LocalizedStringKey
    private let bundle: Bundle?
    private let dotCount: Int
    private let interval: Double

    public var body: some View {
        HStack(spacing: 0) {
            Text(text, bundle: bundle)
            Text(staticDotString)
        }
        .opacity(0)
        .overlay(titleAnimation, alignment: .leading)
    }

    private var dotAnimation: some View {
        DotLoadingAnimation(
            dotCount: dotCount,
            interval: interval
        )
    }

    private var staticDotString: String {
        (0..<dotCount)
            .map { _ in "." }
            .joined(separator: "")
    }

    private var titleAnimation: some View {
        HStack(spacing: 0) {
            Text(text)
            dotAnimation
        }
    }
}
