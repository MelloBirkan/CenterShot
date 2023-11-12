//
//  PointsView.swift
//  CenterShot
//
//  Created by Marcello Gonzatto Birkan on 11/11/23.
//

import SwiftUI

struct PointsView: View {
  @Binding var alertIsVisible: Bool
  @Binding var sliderValue: Double
  @Binding var game: Game
  
  var body: some View {
    let roundedValue = Int(sliderValue.rounded())
    let points = game.points(sliderValue: roundedValue)
    VStack(spacing: 10){
      InstructionText(text: "The slider's value is".uppercased())
      BigNumberText(number: roundedValue)
      BodyText(text: "You scored \(points) Points\n🎉🎉🎉")
      Button(action: {
        withAnimation{
          alertIsVisible = false
        }
        game.startNewRound(points: points)
            }){
              ButtonText(text: "Start New Round")
            }
    }
      .padding()
      .frame(maxWidth: 300)
      .background(Color("BackgroundColor"))
      .cornerRadius(21)
      .shadow(radius: 10, x:5, y: 5)
  }
}

#Preview {
//  static private var alertIsVisible = Binding.constant(false)
//  static private var sliderValue = Binding.constant(50.0)
//  static private var game = Binding.constant(Game())
  PointsView(alertIsVisible: Binding.constant(false), sliderValue: Binding.constant(50.0), game: Binding.constant(Game()))
}
