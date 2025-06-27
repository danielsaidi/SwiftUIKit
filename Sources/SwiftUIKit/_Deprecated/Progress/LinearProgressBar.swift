//
//  LinearProgressBar.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2022-10-13.
//  Copyright © 2022-2025 Daniel Saidi. All rights reserved.
//

#if os(iOS) || os(macOS) || os(tvOS) || os(visionOS)
import SwiftUI

/**
 This view displays progress as a linear bar.

 The view can be styled with a ``Style-swift.struct``. There
 are a couple of built-in styles to choose from, and you can
 create your own styles like this:

 ```
 extension LinearProgressBar.Style {

     static var swedish: LinearProgressBar.Style = {
         var style = LinearProgressBar.Style.standard
         style.backgroundColor = .blue
         style.barColor = .yellow
         return style
     }()
 }
 ```

 You can then use the custom style like this:

 ```
 LinearProgressBar(
     progress: 0.8,
     style: .swedish)
 ```

 You can also customize the built-in styles, to change their
 standard configuration and how this view looks by default.
 */
@available(*, deprecated, message: "Use a native Gauge instead.")
public struct LinearProgressBar: View {

    /// Create a linear progress bar.
    ///
    /// - Parameters:
    ///   - progress: The percentage progress, from `0` to `1`.
    public init(progress: Double) {
        self.progress = progress
    }

    private let progress: Double
    
    @Environment(\.linearProgressBarStyle)
    private var style

    public var body: some View {
        GeometryReader { geo in
            progressBackground
                .overlay(backgroundMaterial)
                .frame(height: style.height)
                .overlay(progressView(for: geo), alignment: .leading)
                .clipShape(Capsule())
        }
        .frame(height: style.height)
        .animation(style.animation, value: progress)
        .accessibilityElement()
    }
}

@available(*, deprecated, message: "Use a native Gauge instead.")
private extension LinearProgressBar {

    var backgroundMaterial: some ShapeStyle {
        style.backgroundMaterial
        #if os(iOS)
            .opacity(style.backgroundMaterialOpacity)
        #endif
    }

    var progressBackground: some View {
        style.backgroundColor
    }

    func progressView(for geo: GeometryProxy) -> some View {
        style.barColor
            .frame(width: geo.size.width * progress)
            .clipShape(Capsule())
            .shadow(style.barShadow)
            .padding(style.barPadding)
    }
}
#endif
