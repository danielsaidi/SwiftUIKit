//
//  CustomRoundedRectangle.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2021-01-05.
//
//  Original solution by @kontiki at:
//  https://stackoverflow.com/questions/56760335/round-specific-corners-swiftui
//

import SwiftUI

/**
 This shape is a rounded rectangle where every corner can be
 given a custom corner radius.
 */
public struct CustomRoundedRectangle: Shape {
    
    public init(
        topLeft: CGFloat = 0.0,
        topRight: CGFloat = 0.0,
        bottomLeft: CGFloat = 0.0,
        bottomRight: CGFloat = 0.0
    ) {
        self.topLeft = topLeft
        self.topRight = topRight
        self.bottomLeft = bottomLeft
        self.bottomRight = bottomRight
    }
    
    private let topLeft: CGFloat
    private let topRight: CGFloat
    private let bottomLeft: CGFloat
    private let bottomRight: CGFloat

    public func path(in rect: CGRect) -> Path {
        let width = rect.size.width
        let height = rect.size.height
        let tr = min(min(self.topRight, height/2), width/2)
        let tl = min(min(self.topLeft, height/2), width/2)
        let bl = min(min(self.bottomLeft, height/2), width/2)
        let br = min(min(self.bottomRight, height/2), width/2)

        var path = Path()
        path.move(to: CGPoint(x: width / 2.0, y: 0))
        path.addLine(to: CGPoint(x: width - tr, y: 0))
        path.addArc(center: CGPoint(x: width - tr, y: tr), radius: tr,
                    startAngle: Angle(degrees: -90), endAngle: Angle(degrees: 0), clockwise: false)
        path.addLine(to: CGPoint(x: width, y: height - br))
        path.addArc(center: CGPoint(x: width - br, y: height - br), radius: br,
                    startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 90), clockwise: false)
        path.addLine(to: CGPoint(x: bl, y: height))
        path.addArc(center: CGPoint(x: bl, y: height - bl), radius: bl,
                    startAngle: Angle(degrees: 90), endAngle: Angle(degrees: 180), clockwise: false)
        path.addLine(to: CGPoint(x: 0, y: tl))
        path.addArc(center: CGPoint(x: tl, y: tl), radius: tl,
                    startAngle: Angle(degrees: 180), endAngle: Angle(degrees: 270), clockwise: false)
        return path
    }
}

struct CustomRoundedRectangle_Previewsectangle: PreviewProvider {
    static var previews: some View {
        CustomRoundedRectangle(topLeft: 10, topRight: 20, bottomLeft: 30, bottomRight: 40)
            .foregroundColor(.red)
            .padding()
    }
}
