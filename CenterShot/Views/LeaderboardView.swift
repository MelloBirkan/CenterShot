//
//  LeaderboardView.swift
//  CenterShot
//
//  Created by Marcello Gonzatto Birkan on 12/11/23.
//

import SwiftUI

struct LeaderboardView: View {
  @Binding var leaderboardIsSHowing: Bool
  @Binding var game: Game
  
  var body: some View {
    ZStack {
      Color("BackgroundColor").ignoresSafeArea()
      VStack(spacing: 10) {
        HeaderView(leaderboardIsSHowing: $leaderboardIsSHowing)
        LabelView()
        ScrollView {
          VStack(spacing: 10) {
            ForEach(game.leaderboardEntries.indices, id: \.self) { index in
              let leaderboardEntry = game.leaderboardEntries[index]
              RowView(index: index + 1, score: leaderboardEntry.score, date: leaderboardEntry.date)
            }
          }
        }
      }
    }
  }
}

struct HeaderView: View {
  @Binding var leaderboardIsSHowing: Bool
  @Environment(\.verticalSizeClass) var verticalSizeClass
  @Environment(\.horizontalSizeClass) var horizontalSizeClass
  
  var body: some View {
    ZStack {
      HStack {
        BigBoldText(text: "Leaderborad")
        if verticalSizeClass == .regular && horizontalSizeClass == .compact {
          Spacer()
        }
      }
      HStack {
        Spacer()
        Button {
          leaderboardIsSHowing = false
        } label: {
          RoundedImageViewFilled(systemName: "xmark")
        }
      }
    }
    .padding([.horizontal, .top])
  }
}

struct LabelView: View {
  var body: some View {
    HStack {
      Spacer()
        .frame(width: Constants.General.roundedViewLength)
      Spacer()
      LabelText(text: "Score")
        .frame(width: Constants.Leaderboard.scoreColumnWidth)
      Spacer()
      LabelText(text: "Date")
        .frame(width: Constants.Leaderboard.dateColumnWidth)
    }
    .padding(.horizontal)
    .frame(maxWidth: Constants.Leaderboard.maxRowWidth)
  }
}

struct RowView: View {
  let index: Int
  let score: Int
  let date: Date
  
  var body: some View {
    HStack {
      RoundedTextView(number: String(index))
      Spacer()
      ScoreText(score: score)
        .frame(width: Constants.Leaderboard.scoreColumnWidth)
      Spacer()
      DateText(date: date)
        .frame(width: Constants.Leaderboard.dateColumnWidth)
    }
    .background(
      RoundedRectangle(cornerRadius: .infinity)
        .strokeBorder(Color("LeaderboardRowColor"), lineWidth: Constants.General.strokeWidth)
    )
    .padding(.horizontal)
    .frame(maxWidth: Constants.Leaderboard.maxRowWidth)
  }
}


#Preview {
  LeaderboardView(leaderboardIsSHowing: Binding.constant(false), game: Binding.constant(Game(loadTestData: true)))
}
