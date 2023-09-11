//
//  CollectionViewLayout.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-11-10.
//  Copyright © 2020-2023 Daniel Saidi. All rights reserved.

#if os(iOS) || os(tvOS)
import UIKit

/**
 This struct can be used to provide ``CollectionView``s with
 a certain layout instead of injecting a provider block.
 */
@available(*, deprecated, message: "The CollectionView namespace is deprecated and will be removed in SwiftUIKit 4.0.")
public struct CollectionViewLayout {
    
    var sectionLayoutProvider: (Int, NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection
}
#endif
