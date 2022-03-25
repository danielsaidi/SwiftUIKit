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
 anything that implements ``FullScreenCoverProvider``.
 
 For instance, you can create an enum where all cases return
 a view and have it implement ``FullScreenCoverProvider``.
 
 To use this class, create a `@StateObject` instance in your
 presenting view, then bind the context to the view with the
 context-specific modifier.
 
 You can now use the `present` functions to present a cover:
 
 ```swift
 @StateObject var context = FullScreenCoverContext()
 
 view.fullScreenCover(context)
 
 context.present(Text("Hello, world!"))
 // ...or if an `AppCover` enum implements `FullScreenCoverProvider`:
 context.present(AppCover.videoPlayer(url))
 ```
 */
@available(iOS 14.0, tvOS 14.0, watchOS 7.0, *)
public class FullScreenCoverContext: PresentationContext<AnyView> {
    
    public func present<Cover: View>(_ cover: @autoclosure @escaping () -> Cover) {
        presentContent(cover().any())
    }
    
    public func present(_ provider: FullScreenCoverProvider) {
        present(provider.cover)
    }
}
