//
//  SimplePicker.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-11-12.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI

/**
 This view renders a simple list of buttons that can be used
 to pick a single option in a list of available options.
 
 This list is a basic alternative that can be used where the
 native pickers aren't supported or desired, e.g. in tvOS.
 
 You can provide a `buttonBuilder` to generate custom button
 views for the available option. If you don't, the init will
 use `SimplePicker.standardButtonBuilder` by default.
 */
public struct SimplePicker<Value: SimplePickerValue>: View {
    
    public init(
        selection: Binding<Value?>,
        options: [Value],
        buttonBuilder: @escaping ButtonBuilder = Self.standardButtonBuilder) {
        self._selection = selection
        self.options = options
        self.buttonBuilder = buttonBuilder
    }
    
    @Binding public var selection: Value?
    public let options: [Value]
    public let buttonBuilder: ButtonBuilder
    
    public typealias ButtonBuilder = (Value, _ isSelected: Bool, _ action: @escaping (Value) -> Void) -> AnyView
    
    public var body: some View {
        VerticalResizingList { width in
            ForEach(options, id: \.id) { value in
                buttonBuilder(value, isSelected(value), { select($0) })
            }
        }
    }
}

public extension SimplePicker {
    
    /**
     This button builder function is used by default when no
     custom function is provided in `init`.
     */
    static func standardButtonBuilder(_ value: Value, _ isSelected: Bool, _ action: @escaping (Value) -> Void) -> AnyView {
        Button(action: { action(value) }) {
            HStack {
                Text(value.displayName)
                Spacer()
                ConditionalView(isSelected) { Image(systemName: "checkmark") }
            }
        }.any()
    }
}

private extension SimplePicker {

    func isSelected(_ value: Value) -> Bool {
        selection?.id == value.id
    }
    
    func select(_ value: Value) {
        print("HEJ")
        if isSelected(value) { return }
        print("HOJ")
        selection = value
    }
}

struct SimplePicker_Previews: PreviewProvider {
    
    enum Option: String, CaseIterable, SimplePickerValue {
        case first, second, third
        var id: String { rawValue }
        var displayName: String { rawValue }
    }
    
    class Context: ObservableObject {
        @Published var selection: Option? = .first
    }
    
    @ObservedObject static var context = Context()
    
    static var previews: some View {
        SimplePicker<Option>(
            selection: $context.selection,
            options: Option.allCases)
            .frame(width: 300)
    }
}
