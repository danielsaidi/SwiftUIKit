//
//  FullScreenCoverContext.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-10-28.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI

/**
 This context can be used to present any `SwiftUI` view as a
 full screen cover. You can either present standard views or
 anything that implements `FullScreenCoverProvider` (e.g. an
 enum where each case returns a specific cover view).
 
 To use this class, create a `@StateObject` instance in your
 presenting view, then bind the context to the view with the
 context-specific modifier. You can now use `present` on the
 context to present full screen covers:
 
 ```swift
 @StateObject var context = FullScreenCoverContext()
 
 view.fullScreenCover(context: context)
 
 context.present(Text("Hello, world!"))
 // ...or if an `AppCover` enum implements `FullScreenCoverProvider`:
 context.present(AppCover.videoPlayer(url))
 ```
 
 `NOTE` In SwiftUI 1, you must use `@ObservedObject` instead
 of `@StateObject`, but then there can be glitches may cause
 the presentation state to cancel. `@StateObject` fixes this.
 */
public class FullScreenCoverContext: PresentationContext<AnyView> {
    
    public override func content() -> AnyView {
        contentView ?? EmptyView().any()
    }
    
    public func present<Cover: View>(_ cover: Cover) {
        present(cover.any())
    }
    
    public func present(_ provider: FullScreenCoverProvider) {
        present(provider.cover)
    }
}
