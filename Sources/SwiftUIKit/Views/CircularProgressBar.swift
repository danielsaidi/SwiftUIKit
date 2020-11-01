//
//  CircularProgressBar.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-10-26.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI

/**
 This view displays a percentual progress as a circle stroke,
 with the progress text in the center of the circle.

 Override the static `standard` style instance to change how
 these views look when you don't provide a `style` in `init`.
 The standard colors are not adaptive and will not adjust to
 e.g. dark mode.
 */
@available(iOS 13.0, watchOS 6.0, macOS 10.15, tvOS 13.0, *)
public struct CircularProgressBar: View {
    
    public init(
        progress: Binding<Double>,
        decimals: Int = 0,
        style: CircularProgressBarStyle = .standard) {
        _progress = progress
        self.decimals = decimals
        self.style = style
    }
    
    private let decimals: Int
    private let style: CircularProgressBarStyle
    
    @Binding private var progress: Double
    
    public var body: some View {
        ZStack {
            baseCircle
            progressCircle
            progressText
        }
    }
    
    
    // MARK: - Private Logic (extension makes previews fail)
    
    private var baseCircle: some View {
        Circle()
            .stroke(lineWidth: style.strokeWidth)
            .foregroundColor(style.strokeColor)
            .background(Circle().fill(style.backgroundColor))
    }
    
    private var progressCircle: some View {
        style.progressModifier(
            Circle()
                .trim(from: 0.0, to: CGFloat(progress))
                .rotation(.degrees(-90))
                .stroke(style: StrokeStyle(lineWidth: style.progressWidth, lineCap: .round, lineJoin: .round))
                .foregroundColor(style.progressColor)
                .animation(.linear)
                .any()
        )
    }
    
    private var progressText: some View {
        Text("\(progressValue, specifier: "%.\(decimals)f")%")
            .lineLimit(1)
            .font(style.titleFont)
            .foregroundColor(style.titleColor)
    }
    
    private var progressValue: Double {
        max(min(progress * 100, 100), 0)
    }
}

@available(iOS 13.0, watchOS 6.0, macOS 10.15, tvOS 13.0, *)
public struct CircularProgressBarStyle {
    
    public init(
        backgroundColor: Color = Color.black.opacity(0.9),
        strokeColor: Color = .black,
        strokeWidth: CGFloat = 2,
        progressColor: Color = .white,
        progressWidth: CGFloat = 8,
        progressModifier: @escaping ViewModifier = { $0 },
        titleColor: Color = .white,
        titleFont: Font = Font.body.bold()) {
        self.backgroundColor = backgroundColor
        self.strokeColor = strokeColor
        self.strokeWidth = strokeWidth
        self.progressColor = progressColor
        self.progressWidth = progressWidth
        self.progressModifier = progressModifier
        self.titleColor = titleColor
        self.titleFont = titleFont
    }
    
    public typealias ViewModifier = (AnyView) -> AnyView

    public var backgroundColor: Color
    public var strokeColor: Color
    public var strokeWidth: CGFloat
    public var progressColor: Color
    public var progressWidth: CGFloat
    public var progressModifier: ViewModifier
    public var titleColor: Color
    public var titleFont: Font
    
    public static var standard = CircularProgressBarStyle()
}

@available(iOS 13.0, watchOS 6.0, macOS 10.15, tvOS 13.0, *)
struct CircularProgressBar_Previews: PreviewProvider {
    
    static var previews: some View {
        
        var swedishStyle = CircularProgressBarStyle.standard
        swedishStyle.backgroundColor = .blue
        swedishStyle.strokeColor = .yellow
        swedishStyle.strokeWidth = 5
        swedishStyle.progressColor = .yellow
        swedishStyle.progressWidth = 15
        swedishStyle.progressModifier = { $0.shadow(.standardToast).any() }
        
        return VStack(spacing: 30) {
            CircularProgressBar(
                progress: .constant(0.1),
                decimals: 2)
            
            CircularProgressBar(
                progress: .constant(0.256),
                decimals: 0,
                style: swedishStyle)
        }
        .background(Color.green.edgesIgnoringSafeArea(.all))
    }
}
