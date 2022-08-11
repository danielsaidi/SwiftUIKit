//
//  CircularProgressBarStyle.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-10-26.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI

/**
 This struct defines a style for ``CircularProgressBar``.
 */

public struct CircularProgressBarStyle {
    
    public init(
        backgroundColor: Color = Color.black.opacity(0.9),
        strokeColor: Color = .black,
        strokeWidth: CGFloat = 2,
        progressColor: Color = .white,
        progressWidth: CGFloat = 8,
        progressModifier: @escaping ViewModifier = { $0 },
        showTitle: Bool = true,
        titleColor: Color = .white,
        titleFont: Font = Font.body.bold()
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
    
    public static var standard = CircularProgressBarStyle()
}
