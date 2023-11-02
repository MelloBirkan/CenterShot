//
//  BackgroundView.swift
//  CenterShot
//
//  Created by Marcello Gonzatto Birkan on 30/10/23.
//

import SwiftUI

struct BackgroundView: View {
  @Binding var game: Game
  
  var body: some View {
    VStack {
      TopView(game: $game)
      Spacer()
      BottomView(game: $game)
    }
    .padding()
    .background(
      Color("BackgroundColor").ignoresSafeArea()
    )
    
  }
}

struct TopView: View {
  @Binding var game: Game
  
  var body: some View {
    HStack {
      RoundedImageViewStroked(systemName: "arrow.counterclockwise")
      Spacer()
      RoundedImageViewFilled(systemName: "list.dash")
    }
  }
}

struct BottomView: View {
  @Binding var game: Game
  
  var body: some View {
    HStack {
      NumberView(title: "Score", number: String(game.score))
      Spacer()
      NumberView(title: "Round", number: String(game.round))
    }
  }
}

struct NumberView: View {
  var title: String
  var number: String
  
  var body: some View {
    VStack(spacing: 5) {
        LabelText(text: title)
        RoundedRectTextView(number: number)
      }
      .padding(5)
    }
  }
  
  #Preview {
    BackgroundView(game: .constant(Game()))
  }
