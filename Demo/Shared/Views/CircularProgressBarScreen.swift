//
//  CircularProgressBarScreen.swift
//  Demo
//
//  Created by Daniel Saidi on 2020-11-27.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI

struct CircularProgressBarScreen: View {
    
    @State private var progress = 0.1
    
    var body: some View {
        MenuList("CircularProgressBar") {
            Section {
                MenuListText("This view can display a percentual progress in a circular bar and can be styled to great extent.")
            }
            
            Section(header: Text("Progress")) {
                Slider(value: $progress, in: 0...1, minimumValueLabel: Text("0%"), maximumValueLabel: Text("100%")) {
                    Text("Prgress")
                }
            }
            
            Section(header: Text("Result")) {
                CircularProgressBar(
                    progress: $progress, decimals: 1, startAngle: 0, style: swedishStyle)
                    .frame(height: 300)
                    .padding()
            }
        }
    }
}

private extension CircularProgressBarScreen {
    
    var swedishStyle: CircularProgressBarStyle {
        var style = CircularProgressBarStyle.standard
        style.backgroundColor = .blue
        style.strokeColor = .yellow
        style.strokeWidth = 6
        style.progressColor = .yellow
        style.progressWidth = 15
        style.progressModifier = { $0.shadow(.standardToast).any() }
        return style
    }
}

struct CircularProgressBarScreen_Previews: PreviewProvider {
    static var previews: some View {
        CircularProgressBarScreen()
    }
}
