//
//  CollectionViewLayout+Shelves.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-11-10.
//  Copyright © 2020 Daniel Saidi. All rights reserved.

#if os(iOS) || os(tvOS)
import UIKit

public extension CollectionViewLayout {
    
    /**
     This layout makes a ``CollectionView`` render itself as
     a vertical list with horizontally scrolling shelve rows.
     
     You can apply this layout using `layout: .shelves()` in
     the ``CollectionView`` init.
     */
    static func shelves(
        itemSize: CGSize = CGSize(width: 200, height: 200),
        headerHeight: CGFloat = 44,
        sectionInsets: NSDirectionalEdgeInsets = NSDirectionalEdgeInsets(top: 20, leading: 0, bottom: 20, trailing: 0),
        itemSpacing: CGFloat = 60
    ) -> CollectionViewLayout {
        CollectionViewLayout { _, _ in
            let layoutSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
            let layoutItem = NSCollectionLayoutItem(layoutSize: layoutSize)
            let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(itemSize.width), heightDimension: .absolute(itemSize.height))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [layoutItem])
            let header = NSCollectionLayoutBoundarySupplementaryItem(
                layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(headerHeight)),
                elementKind: UICollectionView.elementKindSectionHeader,
                alignment: .topLeading
            )
            let section = NSCollectionLayoutSection(group: group)
            section.contentInsets = sectionInsets
            section.interGroupSpacing = itemSpacing
            section.orthogonalScrollingBehavior = .continuous
            section.boundarySupplementaryItems = [header]
            return section
        }
    }
}
#endif
