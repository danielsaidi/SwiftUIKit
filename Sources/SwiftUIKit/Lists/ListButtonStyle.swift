//
//  ListButtonStyle.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2022-10-03.
//  Copyright © 2022-2023 Daniel Saidi. All rights reserved.
//

import SwiftUI


/**
 This button style makes the button label take up the entire
 width and applies a content shape that makes the entire row
 tappable.

 You can apply this button style to an entire `List` to make
 apply this button style to all buttons in the list. You can
 also use the `buttonStyle(.list)` shorthand.
 */
public struct ListButtonStyle: ButtonStyle {

    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(maxWidth: .infinity, alignment: .leading)
            .contentShape(Rectangle())
    }
}

public extension ButtonStyle where Self == ListButtonStyle {

    /**
     This style makes the button label take up all available
     width and also applies a rectangular content shape that
     makes the entire button row tappable.
     */
    static var list: ListButtonStyle { ListButtonStyle() }
}

#if os(iOS) || os(macOS)
struct ListButtonStyle_Previews: PreviewProvider {

    struct Preview: View {

        @State
        private var overlayText = ""

        var body: some View {
            List {
                ForEach(0...100, id: \.self) {
                    button("Button \($0)")
                }
            }
            .overlay(overlay)
            .buttonStyle(.list)
        }

        var overlay: some View {
            Text(overlayText)
                .padding()
                .background(Color.yellow)
                .cornerRadius(10)
                .opacity(overlayText.isEmpty ? 0 : 1)
                .onTapGesture { overlayText = "" }
        }

        func button(_ name: String) -> some View {
            Button(name) {
                overlayText = "\(name) tapped!"
            }
        }
    }

    static var previews: some View {
        Preview()
    }
}
#endif
