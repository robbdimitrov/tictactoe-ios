//
//  HistoryCoordinator.swift
//  TicTacToe
//
//  Created by Robert Dimitrov on 1.03.18.
//  Copyright © 2018 Robert Dimitrov. All rights reserved.
//

import UIKit

class HistoryCordinator: BaseCoordinator {
    
    private var navigationController: UINavigationController
    
    init(withNavigationController navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    override func start() {
        let viewController: HistoryViewController = UIStoryboard.main.instantiateViewController()
        let interactor = HistoryInteractor()
        let viewModel = HistoryViewModel(interactor: interactor, coordinator: self)
        viewController.viewModel = viewModel
        
        navigationController.pushViewController(viewController, animated: true)
    }
    
}
