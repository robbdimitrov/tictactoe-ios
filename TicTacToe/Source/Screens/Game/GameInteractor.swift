//
//  GameInteractor.swift
//  TicTacToe
//
//  Created by Robert Dimitrov on 1.03.18.
//  Copyright © 2018 Robert Dimitrov. All rights reserved.
//

import Foundation

class GameInteractor: BaseInteractor {
    
    var game = Game()
    var player = Player.x
    
    func addTurn(boardIndex: Int) {
        game.turns.append(Turn(player: player, position: boardIndex))
        game.grid[boardIndex] = player.name
        
        // Change player
        player = (player == .o ? .x : .o)
    }
    
    func reset() {
        game = Game()
        player = (Int(arc4random_uniform(UInt32(100))) % 2 == 0 ? .o : .x)
    }
    
    var winner: Player {
        return game.turns.last?.player ?? .x
    }
    
}
