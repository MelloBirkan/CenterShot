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
    100 - abs(self.target - sliderValue)
  }
  
  mutating func startNewRound(points: Int) {
    self.score = points
    self.round += 1
  }
}

