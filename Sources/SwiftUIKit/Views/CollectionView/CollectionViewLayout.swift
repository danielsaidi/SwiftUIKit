//
//  CollectionViewLayout.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-11-10.
//  Copyright © 2020 Daniel Saidi. All rights reserved.

#if os(iOS) || os(tvOS)
import UIKit

/**
 This struct can be used to provide ``CollectionView``s with
 a certain layout instead of injecting a provider block.
 */
public struct CollectionViewLayout {
    
    var sectionLayoutProvider: (Int, NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection
}
#endif
