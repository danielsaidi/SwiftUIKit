//
//  DemoPresentable.swift
//  Demo
//
//  Created by Daniel Saidi on 2020-11-26.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI
import SwiftUIKit

/**
 This presentable can be used in all presentation demos.
 */
enum DemoPresentable: Identifiable, AlertProvider, FullScreenCoverProvider, SheetProvider {
    
    case color(Color), emojis, flag, text(String)
    
    static var allCases: [DemoPresentable] {
        [.text("You chose to present plain text. How exciting!"), .color(.blue), .emojis, .flag]
    }
    
    var id: String {
        switch self {
        case .color: return "color"
        case .emojis: return "emojis"
        case .flag: return "flag"
        case .text: return "text"
        }
    }
    
    var listIcon: Image {
        switch self {
        case .color: return .palette
        case .emojis: return .emoji
        case .flag: return .flag
        case .text: return .text
        }
    }
    
    func listText(for viewType: String) -> String {
        switch self {
        case .color: return "Show a color \(viewType)"
        case .emojis: return "Show a emojis \(viewType)"
        case .flag: return "Show a flag \(viewType)"
        case .text: return "Show a text \(viewType)"
        }
    }
    
    var alert: Alert {
        Alert(
            title: Text("Alert, ohoy!"),
            message: alertText,
            dismissButton: .default(Text("OK")))
    }
    
    var cover: AnyView { view.any() }
    
    var sheet: AnyView { view.any() }
    
    var toast: AnyView { view.any() }
}

private extension DemoPresentable {
    
    var alertText: Text {
        switch self {
        case .color: return Text("You wanted a color, but alerts can't show colors...so here's text! :)")
        case .emojis: return emojiText
        case .flag: return Text("You wanted a flag, but alerts can't show custom views...so here's text! :)")
        case .text(let text): return Text(text)
        }
    }
    
    var emojiText: Text { Text("😀❤️👏👍🎉🎊🍾") }
    
    var flagView: some View {
        VStack(spacing: 0) {
            Color.black.frame(width: 200, height: 50)
            Color.red.frame(width: 200, height: 50)
            Color.yellow.frame(width: 200, height: 50)
        }
    }
    
    @ViewBuilder
    var view: some View {
        switch self {
        case .color(let color): color.edgesIgnoringSafeArea(.bottom)
        case .emojis: emojiText
        case .flag: flagView
        case .text(let text): Text(text)
        }
    }
}
