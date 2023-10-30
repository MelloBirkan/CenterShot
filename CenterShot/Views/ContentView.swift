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
      Color("BackgroundColor")
        .ignoresSafeArea()
      VStack {
        Text("🎯🎯🎯\nPUT THE BULLSEYE AS CLOSE AS YOU CAN TO")
          .bold()
          .multilineTextAlignment(.center)
          .lineSpacing(4.0)
          .font(.footnote)
          .kerning(2)
          .padding(.horizontal, 30)
          .foregroundColor(Color("TextColor"))
        Text(String(game.target))
          .font(.largeTitle)
          .fontWeight(.black)
          .kerning(-1)
          .foregroundColor(Color("TextColor"))
        HStack {
          Text("1")
            .bold()
            .foregroundColor(Color("TextColor"))
          Slider(value: self.$sliderValue, in: 1.0...100)
          Text("100")
            .bold()
            .foregroundColor(Color("TextColor"))
        }
        .padding()
        Button(action: {
            alertIsVisible = true
        }) {
            Text("Hit Me".uppercased())
                .bold()
                .font(.title3)
                .padding(20)
                .foregroundColor(.white)
                .background(
                    ZStack {
                        Color("ButtonColor")
                        LinearGradient(colors: [Color.white.opacity(0.3), Color.clear], startPoint: .top, endPoint: .bottom)
                    }
                    .clipShape(RoundedRectangle(cornerRadius: 21))
                )
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
  }
}

#Preview {
  ContentView()
}
