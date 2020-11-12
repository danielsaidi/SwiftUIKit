//
//  SimpleMultiPicker.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-11-12.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI

/**
 This view renders a simple list of buttons that can be used
 to pick multiple options in a list of available options.
 
 This list is a basic alternative that can be used where the
 native pickers aren't supported or desired, e.g. in tvOS.
 
 You can provide a `buttonBuilder` to generate custom button
 views for the available option. If you don't, the init will
 use `SimplePicker.standardButtonBuilder` by default.
 */
public struct SimpleMultiPicker<Value: SimplePickerValue>: View {
    
    public init(
        selection: Binding<[Value]>,
        options: [Value],
        buttonBuilder: @escaping ButtonBuilder = Self.standardButtonBuilder) {
        self._selection = selection
        self.options = options
        self.buttonBuilder = buttonBuilder
    }
    
    @Binding public var selection: [Value]
    public let options: [Value]
    public let buttonBuilder: ButtonBuilder
    
    public typealias ButtonBuilder = (Value, _ isSelected: Bool, _ action: @escaping (Value) -> Void) -> AnyView
    
    public var body: some View {
        VerticalResizingList { width in
            ForEach(options, id: \.id) { value in
                buttonBuilder(value, isSelected(value), { toggle($0) })
            }
        }
    }
}

public extension SimpleMultiPicker {
    
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

private extension SimpleMultiPicker {
    
    func deselect(_ value: Value) {
        guard isSelected(value) else { return }
        selection.removeAll { $0.id == value.id }
    }

    func isSelected(_ value: Value) -> Bool {
        selection.map { $0.id }.contains(value.id)
    }
    
    func select(_ value: Value) {
        if isSelected(value) { return }
        selection.append(value)
    }

    func toggle(_ value: Value) {
        isSelected(value) ? deselect(value) : select(value)
    }
}

struct SimpleMultiPicker_Previews: PreviewProvider {
    
    enum Option: String, CaseIterable, SimplePickerValue {
        case first, second, third
        var id: String { rawValue }
        var displayName: String { rawValue }
    }
    
    class Context: ObservableObject {
        @Published var selection: [Option] = [.first]
    }
    
    @ObservedObject static var context = Context()
    
    static var previews: some View {
        SimpleMultiPicker<Option>(
            selection: $context.selection,
            options: Option.allCases)
            .frame(width: 300)
    }
}
