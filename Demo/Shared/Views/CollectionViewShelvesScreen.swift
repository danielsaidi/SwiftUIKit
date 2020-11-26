//
//  CollectionViewShelvesScreen.swift
//  Demo
//
//  Created by Daniel Saidi on 2020-11-27.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI

struct CollectionViewShelvesScreen: View {
    
    typealias Row = CollectionViewRow<Int, String>
    var rows: [Row] { (0...19).enumerated().map { Row(section: $0.offset, items: rowItems) } }
    var rowItems: [String] { (0...19).map { _ in UUID().uuidString } }
    
    var body: some View {
        CollectionView(
            rows: rows,
            layout: .shelves(itemSize: itemSize, headerHeight: 60, sectionInsets: sectionInsets, itemSpacing: 20),
            cell: cell,
            supplementaryView: sectionTitle)
            .edgesIgnoringSafeArea(.all)
            .navigationTitle("Collection Shelves")
    }
}

private extension CollectionViewShelvesScreen {
    
    func cell(at indexPath: IndexPath, for item: String) -> some View {
        Color.blue.cornerRadius(20)
    }
    
    var itemSize: CGSize {
        CGSize(width: 150, height: 100)
    }
    
    var sectionInsets: NSDirectionalEdgeInsets {
        NSDirectionalEdgeInsets(top: 0, leading: 20, bottom: 20, trailing: 0)
    }
    
    func sectionTitle(for indexPath: IndexPath) -> some View {
        HStack {
            Text("Section \(indexPath.section)")
            Spacer()
        }
    }
}

private struct ListItem: Identifiable {
    
    let id = UUID().uuidString
}

struct CollectionViewShelvesScreen_Previews: PreviewProvider {
    static var previews: some View {
        CollectionViewShelvesScreen()
    }
}
