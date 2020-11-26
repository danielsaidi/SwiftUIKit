//
//  FlippableViewScreen.swift
//  Demo
//
//  Created by Daniel Saidi on 2020-11-26.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI

struct FlippableViewScreen: View {
    
    @State private var isFlipped: Bool = false
    
    var body: some View {
        SimpleFlipper(
            flipped: $isFlipped,
            front: side(.blue, "Flip me!"),
            back: side(.red, "Flip me back!")
        )
        .padding()
        .onTapGesture { isFlipped.toggle() }
        .navigationBarTitle("Flippable View")
    }
}

private extension FlippableViewScreen {
    
    func side(_ color: Color, _ text: String) -> some View {
        color
            .cornerRadius(10)
            .overlay(Text(text))
    }
}

struct FlippableViewScreen_Previews: PreviewProvider {
    static var previews: some View {
        FlippableViewScreen()
    }
}
struct SimpleFlipper<Front: View, Back: View> : View {
    
    @Binding var flipped: Bool
    var front: Front
    var back: Back

      var body: some View {

            let flipDegrees = flipped ? 180.0 : 0

            return VStack{
                  Spacer()

                  ZStack() {
                        front.flipRotate(flipDegrees).opacity(flipped ? 0.0 : 1.0)
                        back.flipRotate(-180 + flipDegrees).opacity(flipped ? 1.0 : 0.0)
                  }
                  .animation(.easeInOut(duration: 0.5))
                  .onTapGesture { self.flipped.toggle() }
                  Spacer()
            }
      }
}

extension View {

      func flipRotate(_ degrees : Double) -> some View {
            return rotation3DEffect(Angle(degrees: degrees), axis: (x: 0.0, y: 1.0, z: 0.0))
      }

    func placedOnCard<Card: View>(_ card: Card) -> some View {
            return padding(5).frame(width: 250, height: 150, alignment: .center).background(card)
      }
}
