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
      RingsView()
    )
    
  }
}

struct TopView: View {
  @Binding var game: Game
  @State var leadearboardIsShowing = false
  
  var body: some View {
    HStack {
      Button(action: {
        game.restart()
      }){
        RoundedImageViewStroked(systemName: "arrow.counterclockwise")
      }
      Spacer()
      Button(action: {
        leadearboardIsShowing = true
      }){
        RoundedImageViewFilled(systemName: "list.dash")
      }
      .sheet(isPresented: $leadearboardIsShowing, content: {
        LeaderboardView(leaderboardIsSHowing: $leadearboardIsShowing, game: $game)
      })
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

struct RingsView: View {
  @Environment(\.colorScheme) var colorScheme

  var body: some View {
    ZStack {
      Color("BackgroundColor")
        .ignoresSafeArea()
      ForEach(1..<6) { ring in
        let size = CGFloat(ring * 100)
        let opacity = colorScheme == ColorScheme.dark ? 0.1 : 0.3
        Circle()
          .stroke(lineWidth: 20)
          .fill(RadialGradient(gradient: Gradient(colors: [Color("RingsColor").opacity(opacity * 0.8), Color("RingsColor").opacity(0.0)]), center: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, startRadius: 100, endRadius: 300))
          .frame(width: size, height: size)
      }
    }
  }
}
  
  #Preview {
    BackgroundView(game: .constant(Game()))
  }
