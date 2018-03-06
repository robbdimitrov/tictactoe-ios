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
    
    var grid = BehaviorSubject<[String]>(value: [])
    var gameFinished = BehaviorSubject<Bool>(value: false)
    var status = BehaviorSubject<String>(value: "")
    
    override init(interactor: GameInteractor, coordinator: GameCoordinator) {
        super.init(interactor: interactor, coordinator: coordinator)
        
        gameFinished.onNext(interactor.game.isFinished)
        grid.onNext(interactor.game.grid)
        
        interactor.status.subscribe(onNext: { [weak self] gameStatus in
            self?.gameFinished.onNext(interactor.game.isFinished)
            self?.grid.onNext(interactor.game.grid)
            self?.status.onNext(self?.generateStatus(fromGameStatus: gameStatus) ?? "")
            
            switch gameStatus {
            case .inProgress:
                break
            case .draw:
                fallthrough
            case .won(_):
                self?.saveGame()
            }
        }).disposed(by: disposeBag)
    }
    
    func cellViewModel(for index: Int) -> GameCellViewModel {
        var value: String
        do {
            value = try grid.value()[index]
        } catch {
            fatalError("Error getting grid: \(error)")
        }
        let interactor = GameCellInteractor(withValue: value)
        let viewModel = GameCellViewModel(interactor: interactor, coordinator: BaseCoordinator())
        return viewModel
    }
    
    func generateStatus(fromGameStatus gameStatus: GameStatus) -> String {
        switch gameStatus {
        case .draw:
            return "A draw."
        case .won(let player):
            return "Player \(player.name) won."
        case .inProgress:
            return "\(interactor.player.name)'s turn"
        }
    }
    
    func selectedCell(at indexPath: IndexPath) -> Bool {
        guard interactor.game.isFinished == false, interactor.game.grid[indexPath.row] == "" else {
            print("Invalid turn, cell taken")
            return false
        }
        interactor.addTurn(boardIndex: indexPath.row)
        return true
    }
    
    func reset() {
        interactor.reset()
    }
    
    func showHistory() {
        coordinator.showHistory()
    }
    
    func saveGame() {
        interactor.saveGame()
    }
    
}
