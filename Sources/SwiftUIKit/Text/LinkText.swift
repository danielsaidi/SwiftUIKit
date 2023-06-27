//
//  LinkText.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2022-07-31.
//  Copyright © 2022 Daniel Saidi. All rights reserved.
//

#if os(iOS) || os(macOS) || os(watchOS)
import SwiftUI

/**
 This view can be used to render text with tappable links.

 The view is initialized with a list of ``LinkText/Component``
 items, and lets you mix texts and links in any way you like.

 You can use `.font` and `.foregroundColor` as normal if you
 want to style the text and `.accentColor` to tint the links.
 You can use ``LinkText/Style`` to handle additional styling.

 You can also specify optional link accessibility properties
 that will be applied to links that don't specify them. Note
 that the accessibility identifier must be specified by each
 link, since it must be unique.

 Original implementation:
 https://stackoverflow.com/questions/73133551/swiftui-concatenate-multiline-tappable-text/73136937
 */
public struct LinkText: View {

    /**
     Create a link text.

     If the link accessibility properties are provided, they
     will be applied to links that lack explicit information.
     The identifier will be suffixed with the link index.

     - Parameters:
       - components: The components to render.
       - style: The style to apply to the view, by default ``Style/standard``.
       - linkAccessibilityLabel: The accessibility label to add to each link, if any.
       - linkAccessibilityHint: The accessibility hint to add to each link, if any.
     */
    public init(
        components: [Component],
        style: Style = .standard,
        linkAccessibilityLabel: String? = nil,
        linkAccessibilityHint: String? = nil
    ) {
        self.components = components
        self.style = style
        self.linkAccessibilityLabel = linkAccessibilityLabel
        self.linkAccessibilityHint = linkAccessibilityHint
    }

    private let components: [Component]
    private let style: Style
    private let linkAccessibilityLabel: String?
    private let linkAccessibilityHint: String?

    @State
    private var height: CGFloat = 0

    @Environment(\.lineSpacing)
    private var lineSpacing

    public var body: some View {
        VStack {
            GeometryReader { geo in
                ZStack(alignment: .topLeading) {
                    self.stackViews(for: geo)
                }
                .background(calculateHeight($height))
            }
        }.frame(height: height)
    }
}


// MARK: - Types

public extension LinkText {

    /**
     This enum defines the available ``LinkText`` components.
     */
    enum Component {

        /// Plain text.
        case text(String)

        /// A link with a text, action and accessibility.
        case link(
            String,
            accessibilityIdentifier: String? = nil,
            accessibilityLabel: String? = nil,
            accessibilityHint: String? = nil,
            action: () -> Void)
    }

    /**
     This style can be applied to a ``LinkText``.

     There are a couple of built-in styles, e.g. ``standard``
     and ``plain``.
     */
    struct Style {

        /**
         Create a style.

         - Parameters:
         - underlineLinks: Whether or not to underline links, by default `true`.
         */
        public init(
            underlineLinks: Bool = true
        ) {
            self.underlineLinks = underlineLinks
        }

        /// Whether or not to underline links.
        public var underlineLinks: Bool


        /// The standard link text style.
        public static var standard = Style()

        /// A plain style that doesn't underline links.
        public static var plain = Style(
            underlineLinks: false)
    }
}


// MARK: - Private Extensions & Types

private extension LinkText.Component {

    var componentView: LinkTextComponentView {
        switch self {
        case .text(let text):
            return LinkTextComponentView(text)
        case .link(let text, _, _, _, _):
            return LinkTextComponentView(text)
        }
    }
}

private extension LinkText {

    /**
     This function uses `horizontal` and `vertical` counters
     to track horizontal and vertical positions in the stack.
     As a new text or link is added, horizontal is decreased.
     When a new line is required, then vertical is decreased
     and horizontal is reset to 0.
     */
    func stackViews(for geo: GeometryProxy) -> some View { // swiftlint:disable:this function_body_length
        var horizontal: CGFloat = 0
        var vertical: CGFloat = 0

        func view(at index: Int) -> some View {
            let component = components[index]
            let componentView = components[index].componentView
            let numberOfViewsInContent = componentView.count
            let view: AnyView

            switch component {
            case .text:
                view = AnyView(componentView)
            case .link(_, let identifier, let label, let hint, let action):
                let accessibilityIdentifier = identifier
                let accessibilityLabel = label ?? linkAccessibilityLabel
                let accessibilityHint = hint ?? linkAccessibilityHint

                view = AnyView(
                    componentView
                        .underlined(if: style.underlineLinks)
                        .onTapGesture(perform: action)
                        .foregroundColor(.accentColor)
                        .prefersAccessibility(
                            identifier: accessibilityIdentifier,
                            label: accessibilityLabel,
                            hint: accessibilityHint)
                )
            }

            var numberOfViewsRendered = 0

            // Note that the alignment guides can get called
            // multiple times, since the component view body
            // is a ForEach.
            return view
                .alignmentGuide(.leading, computeValue: { dimension in
                    numberOfViewsRendered += 1

                    // Push view to the next line, if needed.
                    let placeOnNextLine = geo.size.width < -1 * (horizontal - dimension.width)
                    if placeOnNextLine {
                        vertical -= dimension.height
                        vertical -= lineSpacing
                        horizontal = -dimension.width
                        return 0
                    }

                    // Set horizontal to the end of the current view
                    let result = horizontal
                    horizontal -= dimension.width
                    return result
                })
                .alignmentGuide(.top, computeValue: { _ in
                    let result = vertical

                    // Reset values if this is the last view.
                    let isLastIndex = index == components.indices.last
                    let isLastRendered = numberOfViewsRendered == numberOfViewsInContent
                    let isLastView = isLastIndex && isLastRendered
                    if isLastView {
                        vertical = 0
                        horizontal = 0
                        numberOfViewsRendered = 0
                    }
                    return result
                })
        }

        return ForEach(components.indices, id: \.self, content: view)
    }

    /**
     This function determines the height of the view that is
     containing our combined text and link views.
     */
    func calculateHeight(_ binding: Binding<CGFloat>) -> some View {
        GeometryReader { geo -> Color in
            DispatchQueue.main.async {
                binding.wrappedValue = geo.frame(in: .local).height
            }
            return .clear
        }
    }
}

/**
 This view is used by ``LinkText`` to render a text view for
 every ``LinkTextComponent`` that should be displayed.
 */
private struct LinkTextComponentView: View {

    init(
        _ text: String,
        separator: Character = " "
    ) {
        let separatorString = String(separator)
        let components = text.split(separator: separator)

        var splitText: [String] = components.enumerated().map {
            let isLast = $0.offset == components.count - 1
            return isLast ? "\($0.element)" : "\($0.element) "
        }
        if text.hasPrefix(separatorString) {
            splitText = [separatorString] + splitText
        }
        if text.hasSuffix(separatorString) {
            splitText += [separatorString]
        }

        self.count = splitText.count
        self._components = State(initialValue: splitText)
    }

    let count: Int

    @State
    private var components: [String]

    var body: some View {
        ForEach(components.indices, id: \.self) {
            Text(components[$0])
        }
    }
}

private extension View {

    @ViewBuilder
    func prefersAccessibility(
        identifier: String?,
        label: String?,
        hint: String?
    ) -> some View {
        if #available(iOS 14.0, watchOS 7, *) {
            self.accessibilityIdentifier(identifier ?? "")
                .accessibilityLabel(label ?? "")
                .accessibilityHint(hint ?? "")
                .accessibilityAddTraits(.isButton)
        } else {
            self
        }
    }

    @ViewBuilder
    func underlined(if condition: Bool) -> some View {
        if condition {
            self.overlay(Underline())
        } else {
            self
        }
    }
}

// MARK: - Underline

/**
 This view is used to mimic an underline.
 */
private struct Underline: View {

    var body: some View {
        VStack {
            Color.clear
            Color.accentColor.frame(height: 1)
        }
    }
}

// MARK: - Preview

struct LinkText_Previews: PreviewProvider {

    static func preview(style: LinkText.Style = .standard) -> some View {
        LinkText(
            components: [
                .text("You must accept our "),
                .link("terms and conditions", action: { print("action 1") }),
                .text(" Also, we have some more "),
                .link("terms and conditions", action: { print("action 2") }),
                .text(" that you need to accept, then some more "),
                .link("terms and conditions", action: { print("action 3") }),
                .text(".")
            ],
            style: style
        )
    }

    static var previews: some View {
        List {
            preview()
            preview()
                .foregroundColor(.red)
                .accentColor(.green)
            preview()
                .font(.headline.italic())
            preview(style: .plain)
                .accentColor(.orange)
                .lineSpacing(10)
        }
    }
}
#endif
