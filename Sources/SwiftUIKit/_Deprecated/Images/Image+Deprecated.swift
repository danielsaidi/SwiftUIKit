import SwiftUI

public extension Image {

    @available(*, deprecated, renamed: "init(image:)")
    init(imageResource: ImageRepresentable) {
        #if os(iOS) || os(watchOS) || os(tvOS)
        self.init(uiImage: imageResource)
        #elseif os(macOS)
        self.init(nsImage: imageResource)
        #endif
    }
}
