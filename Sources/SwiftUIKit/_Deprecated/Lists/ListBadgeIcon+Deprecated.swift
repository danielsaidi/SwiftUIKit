import SwiftUI

@available(iOS 16.0, *)
public extension Image {
    
    @available(*, deprecated, message: "Use the ListBadgeIcon initializer directly instead.")
    func listBadgeIcon(
        _ color: Color,
        height: CGFloat? = 30
    ) -> ListBadgeIcon {
        ListBadgeIcon(
            image: self,
            badgeColor: color,
            height: height
        )
    }
    
    @available(*, deprecated, message: "Use the ListBadgeIcon initializer directly instead.")
    func listBadgeIcon(
        badgeColor: Color,
        iconColor: Color,
        height: CGFloat? = 30
    ) -> ListBadgeIcon {
        ListBadgeIcon(
            image: self,
            badgeColor: badgeColor,
            iconColor: iconColor,
            height: height
        )
    }
}
