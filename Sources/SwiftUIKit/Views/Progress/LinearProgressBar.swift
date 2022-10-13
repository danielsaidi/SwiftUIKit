//
//  LinearProgressBar.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2022-10-13.
//  Copyright © 2022 Daniel Saidi. All rights reserved.
//

#if os(iOS) || os(macOS) || os(tvOS)
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
@available(iOS 15.0, macOS 12.0, tvOS 15.0, *)
public struct LinearProgressBar: View {

    /**
     Create a linear progress bar.

     - Parameters:
       - progress: The percentage progress, from `0` to `1`.
       - style: The style to apply, by default `.standard`.
       - animation: The animation to use when the value changes, by default `.progressBounce`.
     */
    public init(
        progress: Double,
        style: Style = .standard,
        animation: Animation = .progressBounce
    ) {
        self.progress = progress
        self.style = style
        self.animation = animation
    }


    /// The animation to use when the value changes.
    public let animation: Animation

    /// The percentage progress.
    public var progress: Double

    /// The style to apply.
    public let style: LinearProgressBar.Style


    public var body: some View {
        GeometryReader { geo in
            progressBackground
                .overlay(backgroundMaterial)
                .frame(height: style.height)
                .overlay(progressView(for: geo), alignment: .leading)
                .clipShape(Capsule())
        }
        .frame(height: style.height)
        .animation(animation, value: progress)
        .accessibilityElement()
    }
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, *)
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


// MARK: - Style

@available(iOS 15.0, macOS 12.0, tvOS 15.0, *)
public extension LinearProgressBar {

    /**
     This style can be used to style ``LinearProgressBar``.
     */
    struct Style {

        /**
         Create a linear progress bar style.

         When creating a style with a background color, note
         that the color will be placed below the material to
         create a nice frosted effect. If you want the plain
         color, just set `backgroundMaterialOpacity` to 0.

         - Parameters:
           - height: The total height of the bar, by default `10`.
           - backgroundMaterial: The background material, by default `.ultraThin`.
           - backgroundMaterialOpacity: The background material opacity, by default `1`.
           - backgroundColor: The background color, by default `.clear`.
           - barColor: The color of the progress bar, by default `.accentColor`.
           - barPadding: The padding between the progress bar and the background, by default `0`.
           - barShadow: The shadow style to apply to the progress bar, by default `.progressbar`.
         */
        public init(
            height: Double = 10,
            backgroundMaterial: Material = .ultraThin,
            backgroundMaterialOpacity: Double = 1,
            backgroundColor: Color = .clear,
            barColor: Color = .accentColor,
            barPadding: Double = 0,
            barShadow: ViewShadowStyle = .progressBar
        ) {
            self.height = height
            self.backgroundColor = backgroundColor
            self.backgroundMaterial = backgroundMaterial
            self.backgroundMaterialOpacity = backgroundMaterialOpacity
            self.barColor = barColor
            self.barPadding = barPadding
            self.barShadow = barShadow
        }

        public typealias ViewModifier = (AnyView) -> AnyView


        /// The total height of the bar.
        public var height: Double

        /// The background material.
        public var backgroundMaterial: Material

        /// The background material opacity.
        public var backgroundMaterialOpacity: Double

        /// The background color.
        public var backgroundColor: Color

        /// The color of the progress bar.
        public var barColor: Color

        /// The padding between the progress bar and the background.
        public var barPadding: Double

        /// The shadow style to apply to the progress bar.
        public var barShadow: ViewShadowStyle
    }
}


// MARK: - Styles

@available(iOS 15.0, macOS 12.0, tvOS 15.0, *)
public extension LinearProgressBar.Style {

    /// The standard linear progress bar style.
    static var standard = LinearProgressBar.Style()

    /// A style that adds padding to the bar.
    static var padding = LinearProgressBar.Style(
        barPadding: 2
    )

    /// A style that makes the bar tall and adds padding.
    static var tallPadding = LinearProgressBar.Style(
        height: 16,
        barPadding: 3
    )
}


// MARK: - Shadows

public extension ViewShadowStyle {

    /**
     This shadow style can be used with ``LinearProgressBar``.
     */
    static let progressBar = ViewShadowStyle(
        color: .black.opacity(0.4),
        radius: 2,
        x: 1)
}


// MARK: - Animations

public extension Animation {

    /**
     This animation can be used with ``LinearProgressBar``.
     */
    static var progressBounce = Animation.interpolatingSpring(mass: 1, stiffness: 100, damping: 12, initialVelocity: 0)
}


// MARK: - Previews

@available(iOS 15.0, macOS 12.0, tvOS 15.0, *)
struct LinearProgressBar_Previews: PreviewProvider {

    struct Preview: View {

        let style: LinearProgressBar.Style

        @State
        private var progress = 0.5

        var body: some View {
            VStack(spacing: 30) {
                LinearProgressBar(progress: progress, style: style)
                #if os(iOS) || os(macOS) || os(watchOS)
                    .onTapGesture {
                        progress += 0.1
                    }
                #endif
            }
        }
    }

    static var previews: some View {
        ZStack {
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
            }.padding(50)
        }
    }
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, *)
private extension LinearProgressBar.Style {

    static var swedish: LinearProgressBar.Style = {
        var style = LinearProgressBar.Style.tallPadding
        style.backgroundColor = .blue
        style.backgroundMaterialOpacity = 0
        style.barColor = .yellow
        return style
    }()

    static var swedishFrosted: LinearProgressBar.Style = {
        var style = LinearProgressBar.Style.tallPadding
        style.backgroundColor = .blue
        style.barColor = .yellow
        return style
    }()
}
#endif
