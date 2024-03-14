import SwiftUI

public extension Color {
    
    @available(*, deprecated, renamed: "listBackground(forScheme:)")
    static func standardListBackground(
        forScheme scheme: ColorScheme
    ) -> some View {
        listBackground(forScheme: scheme)
    }
}
