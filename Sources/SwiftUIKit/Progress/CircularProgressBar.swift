//
//  CircularProgressBar.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-10-26.
//  Copyright © 2020-2023 Daniel Saidi. All rights reserved.
//

import SwiftUI

/**
 This view displays progress as a circle progress view, with
 the progress text in the center of the circle.
 
 ``startAngle`` is the number of degrees from the circle top,
 going clockwise. `0` means that the arc starts from the top,
 `90` from the right etc.

 The view can be styled with a ``Style-swift.struct``. There
 are a couple of built-in styles to choose from, and you can
 create your own styles like this:

 ```
 extension CircularProgressBar.Style {

     static var swedish: CircularProgressBar.Style = {
         var style = CircularProgressBar.Style.standard
         style.backgroundColor = .blue
         style.strokeColor = .yellow
         style.strokeWidth = 5
         style.progressColor = .yellow
         style.progressWidth = 15
         style.progressModifier = { $0.shadow(.elevated).any() }
         return style
     }()
 }
 ```

 You can then use the custom style like this:

 ```
 CircularProgressBar(
     progress: 0.8,
     style: .swedish)
 ```

 You can also customize the built-in styles, to change their
 standard configuration and how this view looks by default.
 */
public struct CircularProgressBar: View {

    /**
     Create a circular progress bar.

     - Parameters:
       - progress: The percentage progress, from `0` to `1`.
       - decimals: The number of decimals to display, by default `0`.
       - startAngle: The start angle in degrees, by default `0`.
       - style: The style to apply, by default `.standard`.
     */
    public init(
        progress: Double,
        decimals: Int = 0,
        startAngle: Double = 0,
        style: Style = .standard
    ) {
        self.progress = progress
        self.decimals = decimals
        self.startAngle = startAngle
        self.style = style
    }

    /// The percentage progress.
    public let progress: Double

    /// The number of decimals to display.
    public let decimals: Int

    /// The start angle in degrees.
    public let startAngle: Double

    /// The style to apply.
    public let style: CircularProgressBar.Style
    
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
            Circle()
                .trim(from: 0.0, to: CGFloat(progress))
                .rotation(.degrees(startAngle - 90))
                .stroke(style: StrokeStyle(lineWidth: style.progressWidth, lineCap: .round, lineJoin: .round))
                .foregroundColor(style.progressColor)
                .animation(.default, value: progress)
                .any()
        )
    }

    @ViewBuilder
    var progressText: some View {
        if style.showTitle {
            style.titleModifier(
                Text("\(progressValue, specifier: "%.\(decimals)f")%")
                    .lineLimit(1)
                    .font(style.titleFont)
                    .foregroundColor(style.titleColor)
                    .any()
            )
        }
    }
    
    var progressValue: Double {
        max(min(progress * 100, 100), 0)
    }
}

public extension CircularProgressBar {

    /**
     This style can be used to style ``CircularProgressBar``.
     */
    struct Style {

        public init(
            backgroundColor: Color = Color.black.opacity(0.9),
            strokeColor: Color = .black,
            strokeWidth: CGFloat = 2,
            progressColor: Color = .white,
            progressWidth: CGFloat = 8,
            progressModifier: @escaping ViewModifier = { $0 },
            showTitle: Bool = true,
            titleColor: Color = .white,
            titleFont: Font = Font.body.bold(),
            titleModifier: @escaping ViewModifier = { $0 }
        ) {
            self.backgroundColor = backgroundColor
            self.strokeColor = strokeColor
            self.strokeWidth = strokeWidth
            self.progressColor = progressColor
            self.progressWidth = progressWidth
            self.progressModifier = progressModifier
            self.showTitle = showTitle
            self.titleColor = titleColor
            self.titleFont = titleFont
            self.titleModifier = titleModifier
        }

        public typealias ViewModifier = (AnyView) -> AnyView

        public var backgroundColor: Color
        public var strokeColor: Color
        public var strokeWidth: CGFloat
        public var progressColor: Color
        public var progressWidth: CGFloat
        public var progressModifier: ViewModifier
        public var showTitle: Bool
        public var titleColor: Color
        public var titleFont: Font
        public var titleModifier: ViewModifier

        public static var standard = CircularProgressBar.Style()
    }
}

#Preview {
    
    struct Preview: View {
        
        @State
        private var progress = 0.1
        
        var body: some View {
            VStack(spacing: 30) {
                CircularProgressBar(
                    progress: progress,
                    decimals: 2)

                CircularProgressBar(
                    progress: progress,
                    decimals: 0,
                    startAngle: 20,
                    style: .swedish
                )
                .shadow(.elevated)
                
                CircularProgressBar(
                    progress: progress,
                    style: .noText
                )
                .shadow(.sticker)
                
                Button("Progress!") {
                    progress += 0.1
                }
            }
            .frame(maxWidth: .infinity)
            .background(Color.green.edgesIgnoringSafeArea(.all))
        }
    }
    
    return Preview()
}

fileprivate extension CircularProgressBar.Style {

    static var swedish: CircularProgressBar.Style = {
        var style = CircularProgressBar.Style.standard
        style.backgroundColor = .blue
        style.strokeColor = .yellow
        style.strokeWidth = 5
        style.progressColor = .yellow
        style.progressWidth = 15
        style.progressModifier = { $0.shadow(.elevated).any() }
        style.titleColor = .yellow
        style.titleFont = .title.bold()
        style.titleModifier = { $0.shadow(.elevated).any() }
        return style
    }()

    static var noText: CircularProgressBar.Style = {
        var style = CircularProgressBar.Style.standard
        style.backgroundColor = .white
        style.strokeColor = .clear
        style.progressColor = .black
        style.showTitle = false
        return style
    }()
}
