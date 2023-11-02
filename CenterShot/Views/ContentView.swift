//
//  ContentView.swift
//  CenterShot
//
//  Created by Marcello Gonzatto Birkan on 13/10/23.
//

import SwiftUI

struct ContentView: View {
  @State private var alertIsVisible = false
  @State private var sliderValue = 50.0
  @State private var game = Game()
  
  
  var body: some View {
    ZStack {
      
      BackgroundView(game: $game)
      VStack {
        InstructionsView(game: $game)
        SliderView(sliderValue: $sliderValue)
        HitMeButtonView(alertIsVisible: $alertIsVisible, sliderValue: $sliderValue, game: $game)
      }
    }
  }
}

struct InstructionsView: View {
  @Binding var game: Game
  
  var body: some View {
    VStack {
      InstructionText(text: "🎯🎯🎯\nPUT THE BULLSEYE AS CLOSE AS YOU CAN TO")
        .padding(.horizontal, 30)
      BigNumberText(number: game.target)
    }
  }
}

#Preview {
  ContentView()
}

struct SliderView: View {
  @Binding var sliderValue: Double
  
  var body: some View {
    HStack {
      SliderLabelText(number: 1)
        .frame(width: 35)
      Slider(value: self.$sliderValue, in: 1.0...100)
      SliderLabelText(number: 100)
        .frame(width: 35)
    }
    .padding()
  }
}

struct HitMeButtonView: View {
  @Binding var alertIsVisible: Bool
  @Binding var sliderValue: Double
  @Binding var game: Game
  
  var body: some View {
    Button(action: {
      alertIsVisible = true
    }) {
      Text("Hit Me".uppercased())
        .padding(20)
        .background(
          ZStack {
            Color("ButtonColor")
            LinearGradient(colors: [Color.white.opacity(0.3), Color.clear], startPoint: .top, endPoint: .bottom)
          }
            .clipShape(RoundedRectangle(cornerRadius: 21))
        )
        .overlay(
          RoundedRectangle(cornerRadius: 21)
            .strokeBorder(Color.white, lineWidth: 2)
        )
        .bold()
        .font(.title3)
        .foregroundColor(.white)
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
        let roundedValue = Int(sliderValue.rounded())
        Text("""
The slider's value is: \(roundedValue)
You Scored \(game.points(sliderValue: roundedValue))
""")
      })
  }
}
