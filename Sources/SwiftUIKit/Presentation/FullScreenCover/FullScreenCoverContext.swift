//
//  FullScreenCoverContext.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2020-10-28.
//  Copyright © 2020-2023 Daniel Saidi. All rights reserved.
//

import SwiftUI

/**
 This context can be used to present any `SwiftUI` view as a
 full screen cover.
 
 To work with strong types, you can create an enum where all
 cases return a cover view, then present that view.
 
 To use this class, just create a `@StateObject` instance in
 your presenting view and bind the context to that view:
 
 ```swift
 @StateObject var context = FullScreenCoverContext()
 
 view.fullScreenCover(context)
 
 context.present(Text("Hello, world!"))
 // ...or if an `AppCover` enum implements `FullScreenCoverProvider`:
 context.present(AppCover.videoPlayer(url))
 ```
 
 You can now use the contexts functions to present any cover.
 */
public class FullScreenCoverContext: PresentationContext<AnyView> {
    
    public func present<Cover: View>(_ cover: @autoclosure @escaping () -> Cover) {
        presentContent(cover().any())
    }
}
