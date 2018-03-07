//
//  DataManager.swift
//  TicTacToe
//
//  Created by Robert Dimitrov on 6.03.18.
//  Copyright © 2018 Robert Dimitrov. All rights reserved.
//

protocol DataManager {
    
    static var shared: Self { get }
    
    var numberOfObjects: Int { get }
    
    func object(atIndex index: Int) -> Game?
    
    func save(_ game: Game)
    
}
