//
//  SimplePickerScreen.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-11-12.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI

/**
 This screen can be used to present a simple picker that has
 an optional header and footer.
 
 To keep things as flexible as possible, this screen doesn't
 adjust the header, picker and footer in any way. This means
 that you are responsible of preparing them to fit your apps,
 e.g. by wrapping a picker in a `List` on iOS, in a vertical
 `ScrollView` on tvOS etc.
 
 You can find templates in this folders. These templates can
 be used to quickly setup pickers, e.g. for tvOS and iOS.
 */
@available(*, deprecated, message: "Use the ForEachPicker or ListPicker components instead")
public struct SimplePickerScreen<Header: View, Picker: View, Footer: View>: DismissableView {
    
    /**
     Create a picker with a custom header, picker and footer.
     */
    public init(
        header: HeaderBuilder?,
        footer: FooterBuilder?,
        @ViewBuilder picker: @escaping PickerBuilder
    ) {
        self.header = header
        self.picker = picker()
        self.footer = footer
    }
    
    private let header: HeaderBuilder?
    private let picker: Picker
    private let footer: FooterBuilder?
    
    public typealias DismissAction = () -> Void
    public typealias HeaderBuilder = (@escaping DismissAction) -> Header
    public typealias PickerBuilder = () -> Picker
    public typealias FooterBuilder = (@escaping DismissAction) -> Footer
    
    @Environment(\.presentationMode) public var presentationMode
    
    public var body: some View {
        VStack(spacing: 0) {
            if header != nil { header?(dismiss) }
            picker
            if footer != nil { footer?(dismiss) }
        }
    }
}

@available(*, deprecated, message: "Use the ForEachPicker or ListPicker components instead")
public extension SimplePickerScreen where Header == EmptyView {

    /**
     Create a picker with a custom picker and footer.
     */
    init(
        footer: @escaping FooterBuilder,
        @ViewBuilder picker: @escaping PickerBuilder
    ) {
        self.init(header: nil, footer: footer, picker: picker)
    }
}

@available(*, deprecated, message: "Use the ForEachPicker or ListPicker components instead")
public extension SimplePickerScreen where Footer == EmptyView {

    /**
     Create a picker with a custom header and picker.
     */
    init(
        header: @escaping HeaderBuilder,
        @ViewBuilder picker: @escaping PickerBuilder
    ) {
        self.init(header: header, footer: nil, picker: picker)
    }
}

@available(*, deprecated, message: "Use the ForEachPicker or ListPicker components instead")
public extension SimplePickerScreen where Header == EmptyView, Footer == EmptyView {

    /**
     Create a picker without header and footer.
     */
    init(@ViewBuilder picker: @escaping PickerBuilder) {
        self.init(header: nil, footer: nil, picker: picker)
    }
}

@available(*, deprecated, message: "Use the ForEachPicker or ListPicker components instead")
struct SimplePickerScreen_Previews: PreviewProvider {
    
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
    
    static func demoHeaderContent(dismissAction: @escaping () -> Void) -> some View {
        #if os(tvOS)
        return VStack {
            demoHeader(dismissAction: dismissAction).padding()
            Divider()
        }
        #else
        return demoHeader(dismissAction: dismissAction)
        #endif
    }
    
    static func demoPicker() -> some View {
        SimpleSinglePicker<DemoSimplePickerValue>(
            selection: $context.selection,
            options: DemoSimplePickerValue.allCases)
    }
    
    static func demoPickerContent() -> some View {
        #if os(tvOS)
        return ScrollView { demoPicker().padding() }
        #else
        return List { demoPicker() }
        #endif
    }
    
    static func demoFooter(dismissAction: @escaping () -> Void) -> some View {
        Button(action: dismissAction) {
            Text("OK")
        }
    }
    
    static func demoFooterContent(dismissAction: @escaping () -> Void) -> some View {
        #if os(tvOS)
        return VStack {
            Divider()
            demoFooter(dismissAction: dismissAction).padding()
        }
        #else
        return demoHeader(dismissAction: dismissAction)
        #endif
    }
    
    static var previews: some View {
        SimplePickerScreen(
            header: demoHeaderContent,
            footer: demoFooterContent,
            picker: demoPickerContent)
    }
}
