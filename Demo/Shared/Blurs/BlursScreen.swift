//
//  BlursScreen.swift
//  Demo
//
//  Created by Daniel Saidi on 2020-11-26.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

#if os(iOS)
import SwiftUI

struct BlursScreen: View {
    
    let blurStyles = UIBlurEffect.Style.allCases
    let gridItem = GridItem(.flexible())
    
    var body: some View {
        ScrollView(.vertical) {
            LazyVGrid(columns: [gridItem, gridItem]) {
                ForEach(blurStyles, id: \.name) { style in
                    listItem(for: style)
                }
            }.padding()
        }.navigationBarTitle("Blurs")
    }
}

private extension BlursScreen {
    
    func listItem(for style: UIBlurEffect.Style) -> some View {
        VStack {
            Image("BlurImage")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .blur(style)
                .cornerRadius(5)
            Text(style.name)
                .forceSingleLine()
                .font(.footnote)
        }.padding(.bottom, 20)
    }
}

struct BlursScreen_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            BlursScreen()
        }
    }
}
#endif
