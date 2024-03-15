//
//  PresentationDetentReference.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2022-11-01.
//  Copyright © 2022-2024 Daniel Saidi. All rights reserved.
//

#if os(iOS)
import SwiftUI

@available(*, deprecated, message: "This has been deprecated, since SwiftUI now has native support for presentation detents.")
@available(iOS 16.0, *)
public enum PresentationDetentReference: Hashable {

    /// The system detent for a sheet at full height.
    case large

    /// The system detent for a sheet that's approximately half the available screen height.
    case medium

    /// A custom detent with the specified fractional height.
    case fraction(_ value: CGFloat)

    ///  A custom detent with the specified height.
    case height(_ value: CGFloat)

    var swiftUIDetent: PresentationDetent {
        switch self {
        case .large: return .large
        case .medium: return .medium
        case .fraction(let value): return .fraction(value)
        case .height(let value): return .height(value)
        }
    }

    var uiKitIdentifier: UISheetPresentationController.Detent.Identifier {
        switch self {
        case .large: return .large
        case .medium: return .medium
        case .fraction(let value): return .fraction(value)
        case .height(let value): return .height(value)
        }
    }
}

@available(*, deprecated, message: "This has been deprecated, since SwiftUI now has native support for presentation detents.")
@available(iOS 16.0, *)
extension Collection where Element == PresentationDetentReference {

    var swiftUISet: Set<PresentationDetent> {
        Set(map { $0.swiftUIDetent })
    }
}

@available(*, deprecated, message: "This has been deprecated, since SwiftUI now has native support for presentation detents.")
@available(iOS 16.0, *)
public extension UISheetPresentationController.Detent.Identifier {

    /// A fraction-specific detent identifier.
    static func fraction(_ value: CGFloat) -> Self {
        .init("Fraction:\(String(format: "%.1f", value))")
    }

    /// A height-specific detent identifier.
    static func height(_ value: CGFloat) -> Self {
        .init("Height:\(value)")
    }
}
#endif
