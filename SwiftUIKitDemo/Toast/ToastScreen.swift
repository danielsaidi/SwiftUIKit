//
//  ToastScreen.swift
//  SwiftUIKitDemo
//
//  Created by Daniel Saidi on 2020-03-05.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI
import SwiftUIKit

struct ToastScreen: View, DemoList {
    
    @ObservedObject var context = ToastContext()
    
    var body: some View {
        ScrollView {
            VStack(spacing: listSpacing) {
                item(title: "Tap me to show a text toast", color: .red, action: showTextToast)
                item(title: "Tap me to show a flag toast", color: .green, action: showFlagToast)
                item(title: "Tap me to show an emoji toast", color: .blue, action: showEmojiToast)
            }
        }
        .navigationBarTitle("Toast")
        .toast(context: context)
    }
}

extension View {
    
    func toast(context: ToastContext) -> some View {
        self.toast(
            isActive: context.binding,
            content: context.toast)
    }
}

extension ToastContext {
    
    var binding: Binding<Bool> {
        .init(get: { self.isActive },
              set: { self.isActive = $0 }
        )
    }
}

private extension ToastScreen {
    
    func item(title: String, color: Color, action: @escaping () -> Void) -> some View {
        DemoListItem(title: title, content: color, effect: { $0 })
            .onTapGesture(perform: action)
    }
    
    func showEmojiToast() {
        context.present(Text("😀❤️👏👍🎉🎊🍾").any())
    }
    
    func showFlagToast() {
        context.present(VStack(spacing: 0) {
            Color.black.frame(width: 200, height: 50)
            Color.red.frame(width: 200, height: 50)
            Color.yellow.frame(width: 200, height: 50)
        }.any())
    }
    
    func showTextToast() {
        context.present(Text("This is a text toast").any())
    }
}

struct ToastScreen_Previews: PreviewProvider {
    static var previews: some View {
        ToastScreen()
    }
}
