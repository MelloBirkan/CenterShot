//
//  Game.swift
//  CenterShot
//
//  Created by Marcello Gonzatto Birkan on 20/10/23.
//

import Foundation

struct Game {
  var target = Int.random(in: 1...100)
  var score = 0
  var round = 1
  var leaderboardEntries: [LeaderboardEntry] = []
  
  init(loadTestData: Bool = false) {
    if loadTestData {
      for _ in 1...10 {
        addToLeaderboard(score: Int.random(in: 1...100))
      }
    }
  }
  
  mutating func points(sliderValue: Int) -> Int {
    var points = 100 - abs(self.target - sliderValue)
    if points == 98 || points == 99 {
      points = 150
    } else if points == 100 {
      points = 200
    }
      return points
  }
  
  mutating func startNewRound(points: Int) {
    addToLeaderboard(score: points)
    self.score += points
    self.round += 1
    target = Int.random(in: 1...100)
  }
  
  mutating func restart() {
    score = 0
    round = 1
    target = Int.random(in: 1...100)
  }
  
  mutating func addToLeaderboard(score: Int) {
    leaderboardEntries.append(LeaderboardEntry(score: score, date: Date()))
    if leaderboardEntries.count > 1 {
      leaderboardEntries.sort { entry1, entry2 in
        entry1.score > entry2.score
      }
    }
  }
}

struct LeaderboardEntry {
  let score: Int
  let date: Date
}

