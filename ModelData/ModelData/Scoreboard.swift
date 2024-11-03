//
//  Scoreboard.swift
//  ModelData
//
//
//

import Foundation

struct Scoreboard {
    var players: [Player] = [
        Player(name: "Elsa", score: 0),
        Player(name: "Linda", score: 0),
        Player(name: "Dak", score: 0),
        Player(name: "Diji", score: 0)
    ]
    
    var state = GameState.setup
    
    mutating func resetScores(to newValue: Int) {

        }
    
}
