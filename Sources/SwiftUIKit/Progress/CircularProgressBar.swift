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

#Preview {
    
    struct Preview: View {
        
        @State
        private var progress = 0.1
        
        var body: some View {
            VStack(spacing: 30) {
                CircularProgressBar(progress: progress)

                CircularProgressBar(progress: progress)
                    .shadow(.elevated)
                    .circularProgressBarStyle(.swedish)
                
                CircularProgressBar(progress: progress)
                    .shadow(.sticker)
                    .circularProgressBarStyle(.noText)
                
                Button("Preview.Progress") {
                    progress += 0.1
                }
            }
            .frame(maxWidth: .infinity)
            .background(Color.green.edgesIgnoringSafeArea(.all))
        }
    }
    
    return Preview()
}

@MainActor
fileprivate extension CircularProgressBar.Style {

    static var swedish: CircularProgressBar.Style {
        var style = CircularProgressBar.Style.standard
        style.animation = .easeIn(duration: 3)
        style.backgroundColor = .blue
        style.decimals = 2
        style.strokeColor = .yellow
        style.strokeWidth = 5
        style.startAngle = 45
        style.progressColor = .yellow
        style.progressWidth = 15
        style.progressModifier = { AnyView($0.shadow(.elevated)) }
        style.titleColor = .yellow
        style.titleFont = .title.bold()
        style.titleModifier = { AnyView($0.shadow(.elevated)) }
        return style
    }

    static var noText: CircularProgressBar.Style {
        var style = CircularProgressBar.Style.standard
        style.backgroundColor = .white
        style.strokeColor = .clear
        style.progressColor = .black
        style.showTitle = false
        return style
    }
}
