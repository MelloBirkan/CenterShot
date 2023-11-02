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

#Preview {
  VStack {
    InstructionText(text: "🎯🎯🎯\nPUT THE BULLSEYE AS CLOSE AS YOU CAN TO")
    BigNumberText(number: 99)
    LabelText(text: "Round")
  }
}
