//
//  LinearProgressBar.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2022-10-13.
//  Copyright © 2022-2024 Daniel Saidi. All rights reserved.
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


// MARK: - Previews

#Preview {

    struct Preview: View {

        let style: LinearProgressBar.Style

        @State
        private var progress = 0.5

        var body: some View {
            VStack(spacing: 30) {
                LinearProgressBar(progress: progress)
                    .linearProgressBarStyle(style)
                #if os(iOS) || os(macOS) || os(watchOS)
                    .onTapGesture {
                        progress += 0.1
                    }
                #endif
            }
        }
    }

    return ZStack {
        LinearGradient(
            colors: [Color.pink, Color.purple],
            startPoint: .topLeading,
            endPoint: .bottomTrailing)
        Image(systemName: "theatermasks")
            .symbolRenderingMode(.hierarchical)
            .resizable()
            .aspectRatio(contentMode: .fit)
        VStack(spacing: 30) {
            ProgressView(value: 0.5)
                .progressViewStyle(.linear)
            Preview(style: .standard)
            Preview(style: .padding)
            Preview(style: .tallPadding)
            Preview(style: .swedish)
            Preview(style: .swedishFrosted)
                .shadow(.elevated)
        }
        .padding(50)
    }
}

private extension LinearProgressBar.Style {

    static var swedish: LinearProgressBar.Style {
        var style = LinearProgressBar.Style.tallPadding
        style.backgroundColor = .blue
        style.backgroundMaterialOpacity = 0
        style.barColor = .yellow
        return style
    }

    static var swedishFrosted: LinearProgressBar.Style {
        var style = LinearProgressBar.Style.tallPadding
        style.animation = .interpolatingSpring()
        style.backgroundColor = .blue
        style.barColor = .yellow
        return style
    }
}
#endif
