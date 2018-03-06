//
//  LocalDataManager.swift
//  TicTacToe
//
//  Created by Robert Dimitrov on 6.03.18.
//  Copyright © 2018 Robert Dimitrov. All rights reserved.
//

import Foundation

class LocalDataManager: DataManager {
    
    private var games = [Game]()
    
    static var shared: LocalDataManager = {
        let manager = LocalDataManager()
        return manager
    }()
    
    func save(_ game: Game) {
        games.append(game)
    }
    
    var allData: [Game] {
        return games
    }
    
}
