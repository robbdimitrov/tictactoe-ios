//
//  AppCoordinator.swift
//  TicTacToe
//
//  Created by Robert Dimitrov on 1.03.18.
//  Copyright © 2018 Robert Dimitrov. All rights reserved.
//

import UIKit

class AppCoordinator: BaseCoordinator {
    
    private var window: UIWindow
    
    init(withWindow window: UIWindow) {
        self.window = window
    }
    
    override func start() {
        let navigationController = UINavigationController()
        window.rootViewController = navigationController
        let coordinator = GameCoordinator(withNavigationController: navigationController)
        coordinator.start()
    }
    
}
