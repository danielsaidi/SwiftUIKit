//
//  DetailPanelHeader.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2022-03-17.
//  Copyright © 2022 Daniel Saidi. All rights reserved.
//

#if os(macOS)
import SwiftUI

/**
 This view is meant to be used in a ``DetailPanel`` and will
 adjust the text to look like a secion header title.
 
 Note that this is an experimental feature that's used while
 the native approach results in a faulty design. This may be
 deprecated in a future version.
 */
public struct DetailPanelHeader: View {
    
    public init(_ text: String) {
        self.text = text
    }
    
    private let text: String
    
    public var body: some View {
        Text(text).detailPanelHeader()
    }
}

public extension Text {
    
    /**
     Apply a detail panel header style to the text.
     */
    func detailPanelHeader() -> some View {
        self.font(.callout.bold())
            .foregroundColor(.secondary)
    }
}

struct DetailPanelHeader_Previews: PreviewProvider {
    
    static var previews: some View {
        DetailPanelHeader("Test")
    }
}
#endif
