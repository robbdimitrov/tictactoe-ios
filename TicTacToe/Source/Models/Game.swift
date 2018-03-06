//
//  Game.swift
//  TicTacToe
//
//  Created by Robert Dimitrov on 1.03.18.
//  Copyright © 2018 Robert Dimitrov. All rights reserved.
//

import Foundation

class Game {
    
    var grid: [String]
    var date = Date()
    var turns = [Turn]()
    var isFinished = false
    var winner: Player?
    
    init(with grid: [String]) {
        self.grid = grid
    }
    
}
