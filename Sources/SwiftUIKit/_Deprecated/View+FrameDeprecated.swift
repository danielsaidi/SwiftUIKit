import SwiftUI

public extension View {
    
    @available(*, deprecated, message: "Use .frame(height:) instead")
    func height(_ height: CGFloat) -> some View {
        self.frame(height: height)
    }
    
    @available(*, deprecated, message: "Use .frame(width:) instead")
    func width(_ width: CGFloat) -> some View {
        self.frame(width: width)
    }
}
