//
//  GameInteractor.swift
//  TicTacToe
//
//  Created by Robert Dimitrov on 1.03.18.
//  Copyright © 2018 Robert Dimitrov. All rights reserved.
//

import Foundation
import RxSwift

class GameInteractor: BaseInteractor {
    
    var game = Game(value: ["grid": [String](repeating: "", count: 9)])
    var player = Player.x
    var status = BehaviorSubject<GameStatus>(value: .inProgress)
    var gameDidSave = PublishSubject<Bool>()
    private var dataManager: DataManager
    
    init(withDataManager dataManager: DataManager) {
        self.dataManager = dataManager
    }
    
    func addTurn(boardIndex: Int) {
        game.turns.append(Turn(value: ["player": player.name, "position": boardIndex]))
        game.grid[boardIndex] = player.name
        
        // Change player
        player = (player == .o ? .x : .o)
        
        // Check for winning combination
        let status = gameStatus()
        self.status.onNext(status)
        
        switch status {
        case .won(let player):
            try! game.realm?.write {
                
            }
            dataManager.update(game, updateBlock: { (game) in
                game.winner = player.name
                game.isFinished = true
            })
        case .draw:
            dataManager.update(game, updateBlock: { (game) in
                game.isFinished = true
            })
        case .inProgress:
            break
        }
    }
    
    func reset() {
        game = Game(value: ["grid": [String](repeating: "", count: 9)])
        player = (Int(arc4random_uniform(UInt32(100))) % 2 == 0 ? .o : .x)
        status.onNext(.inProgress)
    }
    
    private func gameStatus() -> GameStatus {
        guard game.turns.count >= 5 else {
            return .inProgress
        }
        
        if checkEquality(index1: 0, index2: 1, index3: 2) ||
            checkEquality(index1: 0, index2: 4, index3: 8) ||
            checkEquality(index1: 0, index2: 3, index3: 6) {
            
            return .won(player(forPosition: 0)!)
            
        } else if checkEquality(index1: 3, index2: 4, index3: 5) ||
            checkEquality(index1: 1, index2: 4, index3: 7) {
            
            return .won(player(forPosition: 4)!)
            
        } else if checkEquality(index1: 6, index2: 7, index3: 8) {
            
            return .won(player(forPosition: 6)!)
            
        } else if checkEquality(index1: 2, index2: 5, index3: 8) ||
            checkEquality(index1: 2, index2: 4, index3: 6) {
            
            return .won(player(forPosition: 2)!)
            
        } else if game.turns.count == 9 {
            return .draw
        }
        return .inProgress
    }
    
    private func checkEquality(index1: Int, index2: Int, index3: Int) -> Bool {
        guard game.grid[index1] != "", game.grid[index2] != "", game.grid[index3] != "" else {
            return false
        }
        return game.grid[index1] == game.grid[index2] &&
            game.grid[index2] == game.grid[index3]
    }
    
    private func player(forPosition position: Int) -> Player? {
        let turn = game.turns.filter { (turn) -> Bool in
            turn.position == position
        }.first
        if let player = turn?.player {
            return Player(rawValue: player)
        }
        return nil
    }
    
    func saveGame() {
        dataManager.save(game)
        gameDidSave.onNext(true)
    }
    
}
