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
    
    var data: BehaviorRelay<[Game]> { get set }
    
    func viewModel(forCell index: Int) -> HistoryCellViewModelType
    
}

class HistoryViewModel: BaseViewModel<HistoryInteractor, BaseCoordinator>, HistoryViewModelType {
    
    var data: BehaviorRelay<[Game]>
    
    override init(interactor: HistoryInteractor, coordinator: BaseCoordinator) {
        data = BehaviorRelay(value: interactor.games)
        super.init(interactor: interactor, coordinator: coordinator)
    }
    
    func viewModel(forCell index: Int) -> HistoryCellViewModelType {
        let game = data.value[index]
        let cellInteractor = HistoryCellInteractor(withGame: game)
        let viewModel = HistoryCellViewModel(interactor: cellInteractor)
        return viewModel
    }
    
    var gamesCount: Int {
        return data.value.count
    }
    
}
