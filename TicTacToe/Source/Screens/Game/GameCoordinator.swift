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
    
    init(withNavigationController navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    override func start() {
        let viewController: GameViewController = UIStoryboard.main.instantiateViewController()
        let interactor = GameInteractor()
        let viewModel = GameViewModel(interactor: interactor, coordinator: self)
        viewController.viewModel = viewModel
        
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func showHistory() {
        let coordinator = HistoryCordinator(withNavigationController: navigationController)
        coordinator.start()
    }
    
}
