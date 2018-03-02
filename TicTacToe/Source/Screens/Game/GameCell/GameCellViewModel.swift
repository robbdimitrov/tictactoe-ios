//
//  GameCellViewModel.swift
//  TicTacToe
//
//  Created by Robert Dimitrov on 1.03.18.
//  Copyright © 2018 Robert Dimitrov. All rights reserved.
//

import Foundation

protocol GameCellViewModelType {
    
    var value: String { get }
    
}

class GameCellViewModel: BaseViewModel<GameCellInteractor, BaseCoordinator>, GameCellViewModelType {
    
    var value: String {
        return interactor.value
    }
    
}
