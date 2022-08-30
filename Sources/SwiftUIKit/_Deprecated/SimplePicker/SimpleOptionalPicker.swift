//
//  SimpleOptionalPicker.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-11-12.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI

/**
 This view renders a `ForEach` with buttons that can be used
 to pick an optional option in a list of available options.
 
 Note that you have to wrap the `ForEach` in a suitable view
 to serve your needs. For instance, you can use a `List` for
 iOS or a `LazyVStack` in a `ScrollView` for tvOS, where the
 `List` component may not always work as expected.
 
 You can provide a custom `buttonBuilder` to generate custom
 buttons for the available options. Otherwise, the init will
 use the ``SimpleSinglePicker/standardButtonBuilder(_:_:)``. 
 */
@available(*, deprecated, message: "Use the ForEachPicker or ListPicker components instead")
public struct SimpleOptionalPicker<Value: SimplePickerValue>: SimplePicker {
    
    public init(
        selection: Binding<Value?>,
        options: [Value],
        buttonBuilder: @escaping ButtonBuilder = Self.standardButtonBuilder
    ) {
        self._selection = selection
        self.options = options
        self.buttonBuilder = buttonBuilder
    }
    
    @Binding public var selection: Value?
    
    public let options: [Value]
    public let buttonBuilder: ButtonBuilder
    
    public typealias ButtonBuilder = (Value, _ isSelected: Bool) -> AnyView
    
    public var body: some View {
        ForEach(options, id: \.id) { value in
            Button(action: { toggle(value) }, label: {
                buttonBuilder(value, isSelected(value))
            })
        }
    }
}

@available(*, deprecated, message: "Use the ForEachPicker or ListPicker components instead")
private extension SimpleOptionalPicker {

    func isSelected(_ value: Value) -> Bool {
        selection?.id == value.id
    }
    
    func toggle(_ value: Value) {
        selection = isSelected(value) ? nil : value
    }
}

@available(*, deprecated, message: "Use the ForEachPicker or ListPicker components instead")
struct SimpleOptionalPicker_Previews: PreviewProvider {
    
    class Context: ObservableObject {
        @Published var selection: DemoSimplePickerValue? = .first
    }
    
    @ObservedObject static var context = Context()
    
    static var previews: some View {
        List {
            SimpleOptionalPicker<DemoSimplePickerValue>(
                selection: $context.selection,
                options: DemoSimplePickerValue.allCases)
        }
    }
}
