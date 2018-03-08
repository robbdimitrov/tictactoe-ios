//
//  GameCoordinator.swift
//  TicTacToe
//
//  Created by Robert Dimitrov on 1.03.18.
//  Copyright © 2018 Robert Dimitrov. All rights reserved.
//

import UIKit

class GameCoordinator: BaseCoordinator {
    
    private var navigationController: UINavigationController
    private var dataManager: DataManager
    
    init(withNavigationController navigationController: UINavigationController, dataManager: DataManager) {
        self.navigationController = navigationController
        self.dataManager = dataManager
    }
    
    override func start() {
        let viewController: GameViewController = UIStoryboard.main.instantiateViewController()
        let interactor = GameInteractor(withDataManager: dataManager)
        let viewModel = GameViewModel(interactor: interactor, coordinator: self)
        viewController.viewModel = viewModel
        
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func showHistory() {
        let coordinator = HistoryCordinator(withNavigationController: navigationController,
                                            dataManager: dataManager)
        coordinator.start()
    }
    
}
