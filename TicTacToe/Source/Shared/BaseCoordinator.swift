//
//  BaseCoordinator.swift
//  TicTacToe
//
//  Created by Robert Dimitrov on 1.03.18.
//  Copyright © 2018 Robert Dimitrov. All rights reserved.
//

import Foundation
import RxSwift

protocol Coordinator {
    
    func start()
    
}

class BaseCoordinator: Coordinator {
    
    let disposeBag = DisposeBag()
    
    func start() {
        fatalError("Start method should be implemented.")
    }
    
}
