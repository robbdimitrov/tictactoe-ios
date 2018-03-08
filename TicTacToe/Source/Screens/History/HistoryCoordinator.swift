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
    private var dataManager: DataManager
    
    init(withNavigationController navigationController: UINavigationController, dataManager: DataManager) {
        self.navigationController = navigationController
        self.dataManager = dataManager
    }
    
    override func start() {
        let viewController: HistoryViewController = UIStoryboard.main.instantiateViewController()
        let interactor = HistoryInteractor(withDataManager: dataManager)
        let viewModel = HistoryViewModel(interactor: interactor, coordinator: self)
        viewController.viewModel = viewModel
        
        navigationController.pushViewController(viewController, animated: true)
    }
    
}
