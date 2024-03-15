#if os(iOS) || os(macOS)
import SwiftUI

public extension ColorPickerBar {
    
    @available(*, deprecated, message: "Custom styles and configurations must now be applied with view modifiers.")
    init(
        value: Binding<Color?>,
        colors: [Color] = .colorPickerBarColors,
        config: Config = .standard,
        style: Style = .standard
    ) {
        self.init(
            value: value,
            colors: colors
        )
    }
                
    @available(*, deprecated, message: "Custom styles and configurations must now be applied with view modifiers.")
    init(
        value: Binding<Color>,
        colors: [Color] = .colorPickerBarColors,
        config: Config = .standard,
        style: Style = .standard
    ) {
        self.init(
            value: value,
            colors: colors
        )
    }
}
#endif

#if os(iOS)
@available(*, deprecated, renamed: "ImagePicker.PickerError")
public typealias ImagePickerError = ImagePicker.PickerError
#endif
