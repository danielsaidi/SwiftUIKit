//
//  SimplePickerTvScreen.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-11-12.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

#if os(tvOS)
import SwiftUI

/**
 This is a standard simple picker screen for tvOS. It uses a
 custom header with a divider, a picker that is wrapped in a
 scroll view and a footer with an OK button.
 */
@available(*, deprecated, message: "Use the ForEachPicker or ListPicker components instead")
public struct SimplePickerTvScreen<Header: View, Picker: View>: View {
    
    /**
     Create a picker with a custom header, picker and footer.
     */
    public init(
        header: @escaping HeaderBuilder,
        okButtonText: String,
        @ViewBuilder picker: @escaping PickerBuilder
    ) {
        self.header = header
        self.okButtonText = okButtonText
        self.picker = picker
    }
    
    private let header: HeaderBuilder
    private let picker: PickerBuilder
    private let okButtonText: String
    
    public typealias DismissAction = () -> Void
    public typealias HeaderBuilder = (@escaping DismissAction) -> Header
    public typealias PickerBuilder = () -> Picker
    
    public var body: some View {
        SimplePickerScreen(
            header: headerContent,
            footer: footerContent,
            picker: pickerContent)
    }
}

@available(*, deprecated, message: "Use the ForEachPicker or ListPicker components instead")
private extension SimplePickerTvScreen {
    
    func headerContent(_ dismissAction: @escaping DismissAction) -> some View {
        VStack(spacing: 0) {
            header(dismissAction).padding()
            Divider()
        }
    }
    
    func pickerContent() -> some View {
        ScrollView {
            picker().padding()
        }
    }
    
    func footerContent(_ dismissAction: @escaping DismissAction) -> some View {
        VStack(spacing: 0) {
            Divider()
            Button(okButtonText, action: dismissAction).padding()
        }
    }
}

@available(*, deprecated, message: "Use the ForEachPicker or ListPicker components instead")
struct SimplePickerTvScreen_Previews: PreviewProvider {
    
    class Context: ObservableObject {
        @Published var selection: DemoSimplePickerValue = .first
    }
    
    @ObservedObject static var context = Context()
    
    static func demoHeader(dismissAction: @escaping () -> Void) -> some View {
        HStack(spacing: 30) {
            Image.init(systemName: "person")
            Text("Välj grejer")
        }.font(.title)
    }
    
    static func demoPicker() -> some View {
        SimpleSinglePicker<DemoSimplePickerValue>(
            selection: $context.selection,
            options: DemoSimplePickerValue.allCases)
    }

    static var previews: some View {
        SimplePickerTvScreen(
            header: demoHeader,
            okButtonText: "OK",
            picker: demoPicker)
    }
}
#endif
