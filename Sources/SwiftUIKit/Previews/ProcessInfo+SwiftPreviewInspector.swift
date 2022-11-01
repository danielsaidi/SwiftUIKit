//
//  ProcessInfo+Preview.swift
//  SwiftUIKit
//
//  Created by Daniel Saidi on 2021-04-13.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

import SwiftUI

extension ProcessInfo: SwiftPreviewInspector {}

public extension ProcessInfo {

    /**
     Whether or not the code runs in a SwiftUI preview.

     You can check this in your Swift code, as such:

     ```swift
     if ProcessInfo.processInfo.isSwiftUIPreview { ... }
     ```

     This can be used to customize some logic based on if it
     is used in a preview or not.
     */
    var isSwiftUIPreview: Bool {
        environment["XCODE_RUNNING_FOR_PREVIEWS"] == "1"
    }
}

struct CamerasScreen_Previews: PreviewProvider {

    static var previews: some View {
        VStack {
            Text("Is SwiftUI preview?")
                .font(.title)
            Text("\(ProcessInfo.processInfo.isSwiftUIPreview ? "Yes" : "No")")
        }
    }
}
