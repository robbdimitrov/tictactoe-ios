//
//  HistoryViewModel.swift
//  TicTacToe
//
//  Created by Robert Dimitrov on 1.03.18.
//  Copyright © 2018 Robert Dimitrov. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

protocol HistoryViewModelType: ViewModel {
    
    func viewModel(forCell index: Int) -> HistoryCellViewModelType
    
}

class HistoryViewModel: BaseViewModel<HistoryInteractor, BaseCoordinator>, HistoryViewModelType {
    
    var data: BehaviorSubject<[Game]> {
        return interactor.games
    }
    
    override init(interactor: HistoryInteractor, coordinator: BaseCoordinator) {
        super.init(interactor: interactor, coordinator: coordinator)
        
        interactor.fetchData()
    }
    
    func viewModel(forCell index: Int) -> HistoryCellViewModelType {
        do {
            let game = try data.value()[index]
            let cellInteractor = HistoryCellInteractor(withGame: game)
            let viewModel = HistoryCellViewModel(interactor: cellInteractor)
            return viewModel
        } catch {
            fatalError("Error getting data: \(error)")
        }
    }
    
    var gamesCount: Int {
        do {
            return try data.value().count
        } catch {
            print("Error: \(error)")
        }
        return 0
    }
    
}
