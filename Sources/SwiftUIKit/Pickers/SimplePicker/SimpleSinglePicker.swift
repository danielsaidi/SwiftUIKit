//
//  SimpleSinglePicker.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-11-12.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI

/**
 This view renders a simple list of buttons that can be used
 to pick a single nonoptional in a list of available options.
 
 This list is a basic alternative that can be used where the
 native pickers aren't supported or applicable, e.g. in tvOS.
 
 You can provide a `buttonBuilder` to generate custom button
 views for the available option. If you don't, the init will
 use `SimpleSinglePicker.standardButtonBuilder` by default.
 */
@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
public struct SimpleSinglePicker<Value: SimplePickerValue>: SimplePicker {
    
    public init(
        selection: Binding<Value>,
        options: [Value],
        buttonBuilder: @escaping ButtonBuilder = Self.standardButtonBuilder) {
        self._selection = selection
        self.options = options
        self.buttonBuilder = buttonBuilder
    }
    
    @Binding public var selection: Value
    
    public let options: [Value]
    public let buttonBuilder: ButtonBuilder
    
    public typealias ButtonBuilder = (Value, _ isSelected: Bool, _ action: @escaping (Value) -> Void) -> AnyView
    
    public var body: some View {
        LazyVStack {
            ForEach(options, id: \.id) { value in
                buttonBuilder(value, isSelected(value), { select($0) })
            }
        }
    }
    
    /**
     This button builder function is used by default when no
     custom function is provided in `init`.
     */
    public static func standardButtonBuilder(_ value: Value, _ isSelected: Bool, _ action: @escaping (Value) -> Void) -> AnyView {
        let action = { action(value) }
        return Button(action: action) {
            HStack {
                Text(value.displayName)
                Spacer()
                if isSelected { Image(systemName: "checkmark") }
            }
        }.any()
    }
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
private extension SimpleSinglePicker {

    func isSelected(_ value: Value) -> Bool {
        selection.id == value.id
    }
    
    func select(_ value: Value) {
        if isSelected(value) { return }
        selection = value
    }
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
struct SimpleSinglePicker_Previews: PreviewProvider {
    
    enum Option: String, CaseIterable, SimplePickerValue {
        case first, second, third
        var id: String { rawValue }
        var displayName: String { rawValue }
    }
    
    class Context: ObservableObject {
        @Published var selection: Option = .first
    }
    
    @ObservedObject static var context = Context()
    
    static var previews: some View {
        SimpleSinglePicker<Option>(
            selection: $context.selection,
            options: Option.allCases)
            .frame(width: 300)
    }
}
