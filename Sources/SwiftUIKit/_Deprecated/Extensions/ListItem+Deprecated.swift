import SwiftUI

@available(*, deprecated, renamed: "ListButton")
public typealias ListButtonItem = ListButton

@available(*, deprecated, renamed: "ListNavigationButton")
public typealias ListButtonLink = ListNavigationButton

#if os(iOS)
@available(*, deprecated, renamed: "ListNavigationButton")
public typealias ListNavigationButtonItem = ListNavigationButton
#endif

@available(*, deprecated, renamed: "ListNavigationLink")
public typealias ListNavigationLinkItem = ListNavigationLink

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
@available(*, deprecated, renamed: "ListText")
public typealias ListTextItem = ListText

@available(*, deprecated, renamed: "ListToggle")
public typealias ListToggleItem = ListToggle
