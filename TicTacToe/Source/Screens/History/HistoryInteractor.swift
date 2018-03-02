//
//  HistoryInteractor.swift
//  TicTacToe
//
//  Created by Robert Dimitrov on 1.03.18.
//  Copyright © 2018 Robert Dimitrov. All rights reserved.
//

import Foundation

protocol HistoryInteractorType: Interactor {
    
    var games: [Game] { get set }
    
    func fetchData()
    
}

class HistoryInteractor: BaseInteractor, HistoryInteractorType {
    
    var games = [Game]()
    
    func fetchData() {
        
    }
    
}
