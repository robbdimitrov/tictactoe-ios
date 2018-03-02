//
//  GameViewModel.swift
//  TicTacToe
//
//  Created by Robert Dimitrov on 1.03.18.
//  Copyright © 2018 Robert Dimitrov. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class GameViewModel: BaseViewModel<GameInteractor, GameCoordinator> {
    
    var grid: BehaviorRelay<[String]> {
        return BehaviorRelay<[String]>(value: interactor.game.grid)
    }
    
    var gameFinished: BehaviorRelay<Bool> {
        return BehaviorRelay<Bool>(value: interactor.game.isFinished)
    }
    
    var gameWinner: BehaviorRelay<Player> {
        return BehaviorRelay<Player>(value: interactor.winner)
    }
    
    func cellViewModel(for index: Int) -> GameCellViewModel {
        let value = grid.value[index]
        let interactor = GameCellInteractor(withValue: value)
        let viewModel = GameCellViewModel(interactor: interactor, coordinator: BaseCoordinator())
        return viewModel
    }
    
    func selectedCell(at indexPath: IndexPath) -> Bool {
        guard interactor.game.grid[indexPath.row] == "" else {
            print("Invalid turn, cell taken")
            return false
        }
        interactor.addTurn(boardIndex: indexPath.row)
        return true
    }
    
}
