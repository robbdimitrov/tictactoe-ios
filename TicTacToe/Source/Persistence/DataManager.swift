//
//  DataManager.swift
//  TicTacToe
//
//  Created by Robert Dimitrov on 6.03.18.
//  Copyright © 2018 Robert Dimitrov. All rights reserved.
//

protocol DataManager {
    
    func allObjects() -> [Game]
    
    func save(_ game: Game)
    
    func update(_ game: Game, updateBlock: (Game) -> Void)
    
}
