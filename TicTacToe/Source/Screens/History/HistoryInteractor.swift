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
    private var dataManager: DataManager
    
    init(withDataManager dataManager: DataManager) {
        self.dataManager = dataManager
    }
    
    func fetchData() {
        games.onNext(dataManager.allObjects())
    }
    
}
