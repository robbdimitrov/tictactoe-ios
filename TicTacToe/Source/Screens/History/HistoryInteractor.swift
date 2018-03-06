//
//  HistoryInteractor.swift
//  TicTacToe
//
//  Created by Robert Dimitrov on 1.03.18.
//  Copyright © 2018 Robert Dimitrov. All rights reserved.
//

import Foundation
import RxSwift

protocol HistoryInteractorType: Interactor {
    
    func fetchData()
    
}

class HistoryInteractor: BaseInteractor, HistoryInteractorType {
    
    var games = BehaviorSubject<[Game]>(value: [])
    
    func fetchData() {
        games.onNext(LocalDataManager.shared.allData)
    }
    
}
