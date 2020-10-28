//
//  DemoToast.swift
//  SwiftUIKitDemo
//
//  Created by Daniel Saidi on 2020-06-06.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI
import SwiftUIKit

enum DemoToast: ToastProvider {
    
    case emojis, flag, text
    
    var toast: AnyView {
        switch self {
        case .emojis: return Text("😀❤️👏👍🎉🎊🍾").any()
        case .flag: return flagView.any()
        case .text: return Text("This is a text toast").any()
        }
    }
    
    var title: String {
        switch self {
        case .emojis: return "emoji"
        case .flag: return "flag"
        case .text: return "text"
        }
    }
}

private extension DemoToast {
    
    var flagView: some View {
        VStack(spacing: 0) {
            Color.black.frame(width: 200, height: 50)
            Color.red.frame(width: 200, height: 50)
            Color.yellow.frame(width: 200, height: 50)
        }
    }
}
