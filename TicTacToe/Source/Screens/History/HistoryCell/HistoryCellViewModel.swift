//
//  HistoryCellViewModel.swift
//  TicTacToe
//
//  Created by Robert Dimitrov on 1.03.18.
//  Copyright © 2018 Robert Dimitrov. All rights reserved.
//

import UIKit

protocol HistoryCellViewModelType {
    
    var winnerText: String { get }
    var turnsText: String { get }
    var dateText: String { get }
    
}

class HistoryCellViewModel: HistoryCellViewModelType {
    
    private var interactor: HistoryCellInteractor
    var winnerText: String
    var turnsText: String
    var dateText: String
    
    init(interactor: HistoryCellInteractor) {
        self.interactor = interactor
        winnerText = interactor.winner.name
        turnsText = "\(interactor.game.turns.count)"
        dateText = DateFormatter.shared.string(from: interactor.game.date)
    }
    
}
