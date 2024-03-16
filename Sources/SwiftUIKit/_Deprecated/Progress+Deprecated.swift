import SwiftUI

public extension CircularProgressBar {
    
    @available(*, deprecated, message: "Custom styles must now be applied with .circularProgressBarStyle.")
    init(
        progress: Double,
        decimals: Int = 0,
        startAngle: Double = 0,
        style: Style = .standard
    ) {
        self.init(progress: progress)
    }
}

#if os(iOS) || os(macOS) || os(tvOS) || os(visionOS)
public extension LinearProgressBar {
    
    @available(*, deprecated, message: "Custom styles must now be applied with .circularProgressBarStyle.")
    init(
        progress: Double,
        style: Style = .standard,
        animation: Animation = .progressBounce
    ) {
        self.init(progress: progress)
    }
}
#endif

@available(*, deprecated, message: "This is deprecated, use the new SwiftUI animations instead")
public extension Animation {

    static var progressBounce = Animation.interpolatingSpring(mass: 1, stiffness: 100, damping: 12, initialVelocity: 0)
}
