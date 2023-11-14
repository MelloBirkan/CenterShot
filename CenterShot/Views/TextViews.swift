//
//  TextViews.swift
//  CenterShot
//
//  Created by Marcello Gonzatto Birkan on 25/10/23.
//

import SwiftUI

struct InstructionText: View {
  var text: String
  
  var body: some View {
    Text(text)
      .bold()
      .multilineTextAlignment(.center)
      .lineSpacing(4.0)
      .font(.footnote)
      .kerning(2)
      .foregroundColor(Color("TextColor"))
  }
}

struct SliderLabelText: View {
  let number: Int
  
  var body: some View {
    Text(String(number))
      .bold()
      .foregroundColor(Color("TextColor"))
  }
}

struct BigNumberText: View {
  var number: Int

  var body: some View {
    Text(String(number))
      .font(.largeTitle)
      .fontWeight(.black)
      .kerning(-1)
      .foregroundColor(Color("TextColor"))
  }
}

struct LabelText: View {
  let text: String
  
  var body: some View {
      Text(text.uppercased())
      .kerning(1.5)
      .font(.caption)
        .fontWeight(.medium)
        .foregroundStyle(Color("TextColor"))
  }
}

struct ButtonText: View {
  let text: String
  
  var body: some View {
    Text(text.capitalized)
      .bold()
      .font(.body)
      .padding()
      .frame(maxWidth: .infinity)
      .background(
        Color.accentColor
      )
      .cornerRadius(12)
      .foregroundStyle(.white)
  }
}

struct BodyText: View {
  let text: String
  
  var body: some View {
      Text(text)
      .font(.subheadline)
      .fontWeight(.semibold)
      .multilineTextAlignment(.center)
      .lineSpacing(12)
  }
}

struct ScoreText: View {
  let score: Int
  
  var body: some View {
    Text(String(score))
      .bold()
      .foregroundColor(Color("TextColor"))
      .kerning(-0.2)
      .font(.title3)
  }
}

struct DateText: View {
  let date: Date
  
  var body: some View {
    Text(date, style: .time)
      .bold()
      .foregroundColor(Color("TextColor"))
      .kerning(-0.2)
      .font(.title3)
  }
}

#Preview {
  VStack {
    InstructionText(text: "🎯🎯🎯\nPUT THE BULLSEYE AS CLOSE AS YOU CAN TO")
    BigNumberText(number: 99)
    LabelText(text: "Round")
    BodyText(text: "You have score 200 points\n🎉🎉🎉")
    ButtonText(text: "next round")
    ScoreText(score: 111)
    DateText(date: Date())
  }
  .padding()
}
