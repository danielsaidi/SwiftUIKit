import SwiftUI

public extension ListPicker {
    
    @available(*, deprecated, message: "ListPicker no longer applies a title. Use the title-less initializer and apply the title manually.")
    init(
        title: String,
        items: [Item],
        selection: Binding<Item>,
        animatedSelection: Bool = false,
        dismissAfterPick: Bool = true,
        listItem: @escaping ItemViewBuilder) {
        self.init(
            sections: [ListPickerSection(title: "", items: items)],
            selection: selection,
            animatedSelection: animatedSelection,
            dismissAfterPick: dismissAfterPick,
            listItem: listItem)
    }
    
    @available(*, deprecated, message: "ListPicker no longer applies a title. Use the title-less initializer and apply the title manually.")
    init(
        title: String,
        sections: [ListPickerSection<Item>],
        selection: Binding<Item>,
        animatedSelection: Bool = false,
        dismissAfterPick: Bool = true,
        listItem: @escaping ItemViewBuilder) {
        self.init(
            sections: sections,
            selection: selection,
            animatedSelection: animatedSelection,
            dismissAfterPick: dismissAfterPick,
            listItem: listItem)
    }
}

public extension ListMultiPicker {
    
    @available(*, deprecated, message: "ListMultiPicker no longer applies a title. Use the title-less initializer and apply the title manually.")
    init(
        title: String,
        items: [Item],
        selection: Binding<[Item]>,
        listItem: @escaping ItemViewBuilder) {
        self.init(
            items: items,
            selection: selection,
            listItem: listItem)
    }
    
    @available(*, deprecated, message: "ListMultiPicker no longer applies a title. Use the title-less initializer and apply the title manually.")
    init(
        title: String,
        sections: [ListPickerSection<Item>],
        selection: Binding<[Item]>,
        listItem: @escaping ItemViewBuilder) {
        self.init(
            sections: sections,
            selection: selection,
            listItem: listItem)
    }
}

public extension SystemFontListPicker {
    
    @available(*, deprecated, message: "SystemFontListPicker no longer applies a title. Use the title-less initializer and apply the title manually.")
    init(
        title: String,
        selectedFontName: Binding<String>,
        fonts: [SystemFontPickerFont]? = nil,
        itemFontSize: CGFloat = 20,
        dismissAfterPick: Bool = true) {
        self.init(
            selectedFontName: selectedFontName,
            fonts: fonts,
            itemFontSize: itemFontSize,
            dismissAfterPick: dismissAfterPick)
    }
}
