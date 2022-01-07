import SwiftUI

@available(*, deprecated, renamed: "ListButton")
public typealias ListButtonItem = ListButton

@available(*, deprecated, renamed: "ListNavigationButton")
public typealias ListButtonLink = ListNavigationButton

#if os(iOS)
@available(*, deprecated, renamed: "ListButtonLink")
public typealias ListButtonLinkItem = ListButtonLink
#endif

@available(*, deprecated, renamed: "ListNavigationLink")
public typealias ListNavigationLinkItem = ListNavigationLink

@available(*, deprecated, renamed: "ListText")
public typealias ListTextItem = ListText

@available(*, deprecated, renamed: "ListToggle")
public typealias ListToggleItem = ListToggle
