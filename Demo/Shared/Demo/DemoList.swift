//
//  DemoList.swift
//  Demo
//
//  Created by Daniel Saidi on 2020-11-26.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI

struct DemoList<Content: View>: View {
    
    init(_ title: String, @ViewBuilder content: @escaping () -> Content) {
        self.title = title
        self.content = content
    }
    
    private let title: String
    private let content: () -> Content
    
    var body: some View {
        List {
            content()
        }
        .listStyle(GroupedListStyle())
        .navigationTitle(title)
    }
}

struct DemoList_Previews: PreviewProvider {
    static var previews: some View {
        DemoList("List") {
            Text("This")
            Text("is")
            Text("a")
            Text("Spartan")
            Text("list!")
        }
    }
}
