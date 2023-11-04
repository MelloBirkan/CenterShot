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
    self.score += points
    self.round += 1
    target = Int.random(in: 1...100)
  }
  
  mutating func restart() {
    score = 0
    round = 1
    target = Int.random(in: 1...100)
  }
}

