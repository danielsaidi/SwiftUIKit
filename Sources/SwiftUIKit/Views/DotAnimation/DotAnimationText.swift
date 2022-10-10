//
//  DotAnimationText.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2022-08-09.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import SwiftUI

/**
 This text view renders a text with a ``DotAnimation`` added
 after the text, to animate a loading state.

 The view just renders plain text, so you can style the text
 just like you would any other text.
 */
public struct DotAnimationText: View {

    /**
     Create a dot animation text.

     - Parameters:
       - text: The text to present.
       - dotCount: The max number of dots, by default `3`.
       - interval: The timer tick interval in seconds, by default `0.8`.
     */
    public init(
        text: String,
        dotCount: Int = 3,
        interval: Double = 0.8
    ) {
        self.text = text
        self.dotCount = dotCount
        self.interval = interval
    }

    private let text: String
    private let dotCount: Int
    private let interval: Double

    public var body: some View {
        HStack(spacing: 0) {
            Text(text)
            Text(staticDotString)
        }
        .opacity(0)
        .overlay(titleAnimation, alignment: .leading)
    }
}

private extension DotAnimationText {

    var dotAnimation: some View {
        DotAnimation(
            dotCount: dotCount,
            interval: interval
        )
    }

    var staticDotString: String {
        (0..<dotCount)
            .map { _ in "." }
            .joined(separator: "")
    }

    var titleAnimation: some View {
        HStack(spacing: 0) {
            Text(text)
            dotAnimation
        }
    }
}

struct DotAnimationText_Previews: PreviewProvider {

    static var previews: some View {
        DotAnimationText(text: "Testing")
    }
}
