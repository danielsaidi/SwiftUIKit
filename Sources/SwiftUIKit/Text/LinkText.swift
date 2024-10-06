//
//  LinkText.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2022-07-31.
//  Copyright © 2022-2024 Daniel Saidi. All rights reserved.
//
//  Original: https://stackoverflow.com/questions/73133551
//

#if os(iOS) || os(macOS) || os(watchOS)
import SwiftUI

/**
 This view can be used to render text with tappable links.

 The view is initialized with a list of ``LinkText/Component``
 items, and lets you mix texts and links in any way you like.

 You can use `.font` and `.foregroundColor` as normal if you
 want to style the text and `.accentColor` to tint the links.
 Apply a `.linkTextStyle` modifier for view-specific styling.

 You can specify optional link accessibility properties that
 will be applied to links that don't specify them. Note that
 the accessibility identifier must be specified by each link,
 since it must be unique.
 */
public struct LinkText: View {

    /// Create a link text.
    ///
    /// Although the view can be styled with `.linkTextStyle`
    /// most styling can be done with native modifiers, like
    /// `foregroundColor`, `accentColor`, `lineSpacing`, etc.
    ///
    /// If an accessibility property is provided, it will be
    /// applied to links that lack explicit information. The
    /// identifier will be suffixed with the link index.
    ///
    /// - Parameters:
    ///   - components: The components to render.
    ///   - linkAccessibilityLabel: The accessibility label to add to each link, if any.
    ///   - linkAccessibilityHint: The accessibility hint to add to each link, if any.
    public init(
        components: [Component],
        linkAccessibilityLabel: String? = nil,
        linkAccessibilityHint: String? = nil
    ) {
        self.components = components
        self.accessibilityLabel = linkAccessibilityLabel
        self.accessibilityHint = linkAccessibilityHint
    }
    
    @available(*, deprecated, message: "Apply a style with linkTextStyle instead.")
    public init(
        components: [Component],
        style: Style,
        linkAccessibilityLabel: String? = nil,
        linkAccessibilityHint: String? = nil
    ) {
        self.components = components
        self.accessibilityLabel = linkAccessibilityLabel
        self.accessibilityHint = linkAccessibilityHint
    }

    private let components: [Component]
    private let accessibilityLabel: String?
    private let accessibilityHint: String?

    @State
    private var height: CGFloat = 0

    @Environment(\.lineSpacing)
    private var lineSpacing
    
    @Environment(\.linkTextStyle)
    private var style
    

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

    /// This enum defines available ``LinkText`` components.
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

    
}


// MARK: - Private Extensions & Types

private extension LinkText.Component {

    @MainActor
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

    /// Generate stack views within a geometry reader, using
    /// horizontal and vertical counters to track horizontal
    /// and vertical positions in the stack.
    ///
    /// As a new content is added, `horizontal` is decreased.
    /// When a new line is required, `vertical` is decreased
    /// and horizontal is reset to 0.
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
                view = AnyView(
                    componentView
                        .preferredFontWeight(style.fontWeight)
                        .underlined(if: style.underline)
                        .onTapGesture(perform: action)
                        .foregroundColor(.accentColor)
                        .accessibilityIdentifier(identifier ?? "")
                        .accessibilityLabel(label ?? accessibilityLabel ?? "")
                        .accessibilityHint(hint ?? accessibilityHint ?? "")
                        .accessibilityAddTraits(.isButton)
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

    /// Calculate the height of a view with texts and links.
    func calculateHeight(_ binding: Binding<CGFloat>) -> some View {
        GeometryReader { geo -> Color in
            DispatchQueue.main.async {
                binding.wrappedValue = geo.frame(in: .local).height
            }
            return .clear
        }
    }
}

/// This view is used by ``LinkText`` and renders a view for
/// every ``LinkTextComponent`` that should be displayed.
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
    func underlined(if condition: Bool) -> some View {
        if condition {
            self.overlay(Underline())
        } else {
            self
        }
    }
    
    @ViewBuilder
    func preferredFontWeight(
        _ weight: Font.Weight
    ) -> some View {
        if #available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *) {
            self.fontWeight(weight)
        } else {
            self
        }
    }
}

/// This view is used to mimic an underline.
private struct Underline: View {

    var body: some View {
        VStack {
            Color.clear
            Color.accentColor.frame(height: 1)
        }
    }
}

#Preview {

    struct PreviewText: View {
        
        var body: some View {
            LinkText(
                components: [
                    .text("You must accept our "),
                    .link("terms & conditions", action: { print("action 1") }),
                    .text(". Also, we have some more "),
                    .link("terms & conditions", action: { print("action 2") }),
                    .text(" that you need to accept, then some "),
                    .link("terms & conditions", action: { print("action 3") }),
                    .text(".")
                ]
            )
        }
    }
    
    return List {
        PreviewText()
        PreviewText()
            .foregroundColor(.red)
            .accentColor(.green)
        PreviewText()
            .font(.headline.italic())
            .linkTextStyle(.init(fontWeight: .black))
        PreviewText()
            .accentColor(.orange)
            .lineSpacing(10)
            .linkTextStyle(.plain)
    }
}
#endif
