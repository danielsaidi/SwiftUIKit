//
//  SimplePickerScreen.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-11-12.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI

/**
 This view can be used to present a picker with a main title
 and an OK button that just dismisses the screen.
 
 `TODO` Make it possible to customize this further depending
 on the current platform.
 */
public struct SimplePickerScreen<Picker: View, Title: View>: DismissableView {
    
    public init(
        title: Title,
        okButtonText: String = "OK",
        @ViewBuilder picker: @escaping PickerBuilder) {
        self.title = title
        self.okButtonText = okButtonText
        self.picker = picker()
    }
    
    private let title: Title
    private let okButtonText: String
    private let picker: Picker
    
    public typealias PickerBuilder = () -> Picker
    
    @Environment(\.presentationMode) public var presentationMode
    
    public var body: some View {
        VStack(spacing: 0) {
            title.padding()
            Divider()
            ScrollView { picker.padding() }
            Divider()
            Button(okButtonText, action: dismiss).padding()
        }
    }
}

@available(iOS 14.0, tvOS 14.0, watchOS 7.0, *)
struct SimplePickerScreen_Previews: PreviewProvider {
    
    enum Option: String, CaseIterable, SimplePickerValue {
        case one, two, three, four, five, six, seven, eight, nine, ten
        var id: String { rawValue }
        var displayName: String { rawValue }
    }
    
    class Context: ObservableObject {
        @Published var selection: Option? = .one
    }
    
    @ObservedObject static var context = Context()
    
    static var previews: some View {
        SimplePickerScreen(
            title: Text("Välj grejer").font(.title),
            okButtonText: "Donediddely") {
            SimpleSinglePicker<Option>(
                selection: $context.selection,
                options: Option.allCases)
                .frame(width: 300)
        }
    }
}
