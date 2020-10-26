//
//  CircularProgressBar.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-10-26.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI

/**
 This view displays a progress as a stroked circle, with the
 progress text in the center.
 */
public struct CircularProgressBar: View {
    
    public init(
        progress: Binding<Double>,
        backgroundColor: Color,
        strokeColor: Color,
        strokeWidth: CGFloat = 1,
        progressColor: Color,
        progressWidth: CGFloat = 5,
        textColor: Color,
        decimals: Int = 0) {
        _progress = progress
        self.backgroundColor = backgroundColor
        self.strokeColor = strokeColor
        self.strokeWidth = strokeWidth
        self.progressColor = progressColor
        self.progressWidth = progressWidth
        self.textColor = textColor
        self.decimals = decimals
    }
    
    private let backgroundColor: Color
    private let strokeColor: Color
    private let strokeWidth: CGFloat
    private let progressColor: Color
    private let progressWidth: CGFloat
    private let textColor: Color
    private let decimals: Int
    
    @Binding private var progress: Double
    
    public var body: some View {
        ZStack {
            baseCircle
            progressCircle
            progressText
        }
    }
}

private extension CircularProgressBar {
    
    var baseCircle: some View {
        Circle()
            .stroke(lineWidth: strokeWidth)
            .foregroundColor(strokeColor)
            .background(Circle().fill(backgroundColor))
    }
    
    var progressCircle: some View {
        Circle()
            .trim(from: 0.0, to: CGFloat(progress))
            .rotation(.degrees(-90))
            .stroke(style: StrokeStyle(lineWidth: progressWidth, lineCap: .round, lineJoin: .round))
            .foregroundColor(progressColor)
            .animation(.linear)
    }
    
    var progressText: some View {
        Text("\(displayProgress, specifier: "%.\(decimals)f")%")
            .lineLimit(1)
            .foregroundColor(textColor)
    }
}

private extension CircularProgressBar {
    
    var displayProgress: Double {
        max(min(progress * 100, 100), 0)
    }
}

struct CircularProgressBar_Previews: PreviewProvider {
    
    static var previews: some View {
        CircularProgressBar(
            progress: .constant(0.7),
            backgroundColor: .blue,
            strokeColor: .yellow,
            strokeWidth: 10,
            progressColor: .red,
            progressWidth: 16,
            textColor: .black,
            decimals: 2)
    }
}
