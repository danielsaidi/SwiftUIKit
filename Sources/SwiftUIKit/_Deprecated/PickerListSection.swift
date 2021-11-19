import SwiftUI

@available(*, deprecated, renamed: "ListPickerSection")
public typealias PickerSection = ListPickerSection

public extension ListPickerSection {
    
    @available(*, deprecated, renamed: "header")
    var pickerHeader: some View {
        header
    }
}
