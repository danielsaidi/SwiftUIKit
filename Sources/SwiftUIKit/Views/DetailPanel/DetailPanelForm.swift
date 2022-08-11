//
//  DetailPanelForm.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2022-03-17.
//  Copyright © 2022 Daniel Saidi. All rights reserved.
//

#if os(macOS)
import SwiftUI

/**
 This view is meant to be used in a ``DetailPanel`` and will
 adjust the trailing padding to align with the leading.
 
 Note that this is an experimental feature that's used while
 the native approach results in a faulty design. This may be
 deprecated in a future version.
 */
public struct DetailPanelForm<Content: View>: View {
    
    public init(
        @ViewBuilder content: @escaping ContentBuilder
    ) {
        self.content = content
    }
    
    private let content: ContentBuilder
    
    public typealias ContentBuilder = () -> Content
    
    public var body: some View {
        Form {
            content()
        }.detailPanelForm()
    }
}

public extension Form {
    
    /**
     Apply a detail panel form style to the form.
     */
    func detailPanelForm() -> some View {
        self.padding(.trailing, 10)
    }
}

struct DetailPanelForm_Previews: PreviewProvider {
    
    static var previews: some View {
        DetailPanelForm {
            Text("Test")
        }
    }
}
#endif
