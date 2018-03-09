//
//  InMemoryDataManager.swift
//  TicTacToeTests
//
//  Created by Robert Dimitrov on 7.03.18.
//  Copyright © 2018 Robert Dimitrov. All rights reserved.
//

class InMemoryDataManager: DataManager {
    
    private var storage = [Game]()
    
    func allObjects() -> [Game] {
        return storage
    }
    
    func save(_ game: Game) {
        storage.append(game)
    }
    
    func update(_ game: Game, updateBlock: (Game) -> Void) {
        updateBlock(game)
    }
    
}
