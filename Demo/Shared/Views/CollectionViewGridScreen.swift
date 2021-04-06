//
//  CollectionViewGridScreen.swift
//  Demo
//
//  Created by Daniel Saidi on 2020-11-27.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

#if os(iOS) || os(tvOS)
import SwiftUI
import SwiftUIKit

struct CollectionViewGridScreen: View {
    
    typealias Row = CollectionViewRow<Int, String>
    var rows: [Row] { [Row(section: 0, items: rowItems)] }
    var rowItems: [String] { (0...19).map { _ in UUID().uuidString } }
    
    var body: some View {
        CollectionView(
            rows: rows,
            layout: .verticalGrid(itemsPerRow: 2, itemHeight: 100),
            cell: cell,
            supplementaryView: sectionTitle)
            .edgesIgnoringSafeArea(.all)
            .navigationTitle("Collection Grid")
    }
}

private extension CollectionViewGridScreen {
    
    func cell(at indexPath: IndexPath, for item: String) -> some View {
        Color.blue.cornerRadius(20)
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

struct CollectionViewGridScreen_Previews: PreviewProvider {
    static var previews: some View {
        CollectionViewGridScreen()
    }
}
#endif
