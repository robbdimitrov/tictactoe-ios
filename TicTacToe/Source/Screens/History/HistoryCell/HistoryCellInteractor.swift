//
//  HistoryCellInteractor.swift
//  TicTacToe
//
//  Created by Robert Dimitrov on 2.03.18.
//  Copyright © 2018 Robert Dimitrov. All rights reserved.
//

import Foundation

class HistoryCellInteractor {
    
    var game: Game
    
    init(withGame game: Game) {
        self.game = game
    }
    
    var winner: Player {
        guard game.isFinished == true, let player = game.turns.last?.player else {
            fatalError("Error: Game not finished, winner not available")
        }
        return player
    }
    
}
