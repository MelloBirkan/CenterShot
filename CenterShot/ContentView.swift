//
//  ContentView.swift
//  CenterShot
//
//  Created by Marcello Gonzatto Birkan on 13/10/23.
//

import SwiftUI

struct ContentView: View {
  @State private var alertIsVisible: Bool = false
  @State private var sliderValue: Double = 50.0
  private var guessNumber = 89
  
  var body: some View {
    VStack {
      Text("🎯🎯🎯\nPUT THE BULLSEYE AS CLOSE AS YOU CAN TO")
        .bold()
        .multilineTextAlignment(.center)
        .lineSpacing(4.0)
        .font(.footnote)
        .kerning(2)
      Text("\(guessNumber)")
        .font(.largeTitle)
        .fontWeight(.black)
        .kerning(-1)
      HStack {
        Text("1")
          .bold()
        Slider(value: self.$sliderValue, in: 1.0...100)
        Text("100")
          .bold()
      }
      Button("Hit Me") {
        alertIsVisible = true
      }
      .alert(
        "Hello there",
        isPresented: $alertIsVisible,
        actions: {
          Button("Awsome") {
            print("Alert closed")
          }
        },
        message: {
          Text("The value is: \(sliderValue)")
        })
    }
  }
}

#Preview {
  ContentView()
}
