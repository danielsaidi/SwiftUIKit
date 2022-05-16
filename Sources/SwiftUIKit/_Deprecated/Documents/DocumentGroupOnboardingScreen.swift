#if os(iOS)
import SwiftUI

@available(*, deprecated, renamed: "DocumentGroupSheet")
public typealias DocumentGroupOnboardingScreen = DocumentGroupSheet

public extension DocumentGroupSheet {

    @available(*, deprecated, renamed: "presentFromDocumentGroup")
    func presentAsOnboarding() throws {}
}

@available(*, deprecated, renamed: "DocumentGroupSheetError")
public typealias DocumentGroupOnboardingError = DocumentGroupSheetError
#endif
