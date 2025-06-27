//
//  CircularProgressBar.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-10-26.
//  Copyright © 2020-2025 Daniel Saidi. All rights reserved.
//

import SwiftUI

/**
 This view displays progress as a circle progress view, with
 the progress text in the center of the circle.

 The view can be styled with a ``CircularProgressBar/Style``. 
 There are some built-in styles to choose from. You can also
 create your own styles.
 
 You can apply a style with `.circularProgressBarStyle(...)`.
 */
@available(*, deprecated, message: "Use a native Gauge instead.")
public struct CircularProgressBar: View {

    /// Create a circular progress bar.
    ///
    /// - Parameters:
    ///   - progress: The percentage progress, from `0` to `1`.
    public init(progress: Double) {
        self.progress = progress
    }

    private let progress: Double

    @Environment(\.circularProgressBarStyle)
    private var style
    
    public var body: some View {
        baseCircle
            .overlay(progressCircle)
            .overlay(progressText)
    }
}

@available(*, deprecated, message: "Use a native Gauge instead.")
private extension CircularProgressBar {
    
    var baseCircle: some View {
        Circle()
            .stroke(lineWidth: style.strokeWidth)
            .foregroundColor(style.strokeColor)
            .background(Circle().fill(style.backgroundColor))
    }
    
    var progressCircle: some View {
        style.progressModifier(
            AnyView(
                Circle()
                .trim(from: 0.0, to: CGFloat(progress))
                .rotation(.degrees(style.startAngle - 90))
                .stroke(style: StrokeStyle(lineWidth: style.progressWidth, lineCap: .round, lineJoin: .round))
                .foregroundColor(style.progressColor)
                .animation(style.animation, value: progress)
            )
        )
    }

    @ViewBuilder
    var progressText: some View {
        if style.showTitle {
            style.titleModifier(
                AnyView(
                    Text("\(progressValue, specifier: "%.\(style.decimals)f")%")
                        .lineLimit(1)
                        .font(style.titleFont)
                        .foregroundColor(style.titleColor)
                )
            )
        }
    }
    
    var progressValue: Double {
        max(min(progress * 100, 100), 0)
    }
}
