//
//  DemoListLink.swift
//  Demo
//
//  Created by Daniel Saidi on 2020-11-26.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI

struct DemoListLink<Destination: View>: View {
    
    init(_ text: String, _ image: Image, _ destination: Destination) {
        link = NavigationLink(destination: destination) {
            DemoListItem(text, image)
        }
    }
    
    private let link: NavigationLink<DemoListItem, Destination>
    
    var body: some View { link }
}

struct DemoListLink_Previews: PreviewProvider {
    static var previews: some View {
        DemoListLink("This is a link", .blur, Text("You navigated!"))
    }
}
