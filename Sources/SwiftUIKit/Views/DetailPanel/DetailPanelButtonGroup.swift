//
//  DetailPanelButtonGroup.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2022-03-17.
//  Copyright © 2022 Daniel Saidi. All rights reserved.
//

#if os(macOS)
import SwiftUI

/**
 This view is meant to be used in a ``DetailPanel`` and will
 mimic the provided buttons horizontally, in a way that aims
 to mimic the look of a native, segmented button group.
 
 This approach is currently needed since the only way to get
 a segmented group is to use a picker, which only supports a
 single selection.
 
 Note that this is an experimental feature that's used while
 the native approach results in a faulty design. This may be
 deprecated in a future version.
 */
public struct DetailPanelButtonGroup<Content: View>: View {
    
    public init(
        @ViewBuilder content: @escaping ContentBuilder
    ) {
        self.content = content
    }
    
    private let content: ContentBuilder
    
    public typealias ContentBuilder = () -> Content
    
    public var body: some View {
        HStack(spacing: 5) {
            content()
        }
        .frame(minHeight: 25)
        .padding(.horizontal, 3)
        .background(background.opacity(0.5))
        .cornerRadius(5)
    }
}

private extension DetailPanelButtonGroup {
    
    @ViewBuilder
    var background: some View {
        if #available(macOS 12.0, *) {
            Color.clear.background(.quaternary)
        } else {
            Color.gray  // Unverified
        }
    }
}

struct DetailPanelButtonGroup_Previews: PreviewProvider {
    
    static var previews: some View {
        DetailPanelButtonGroup {
            Text("Test")
        }
    }
}
#endif
