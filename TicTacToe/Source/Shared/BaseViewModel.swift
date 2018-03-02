//
//  BaseViewModel.swift
//  TicTacToe
//
//  Created by Robert Dimitrov on 2.03.18.
//  Copyright © 2018 Robert Dimitrov. All rights reserved.
//

import Foundation

protocol ViewModel {
    
    associatedtype InteractorType
    associatedtype CoordinatorType
    
    var interactor: InteractorType { get set }
    var coordinator: CoordinatorType { get set }
    
}

class BaseViewModel<I: Interactor, C: Coordinator>: ViewModel {
    
    var interactor: I
    var coordinator: C
    
    init(interactor: I, coordinator: C) {
        self.interactor = interactor
        self.coordinator = coordinator
    }
    
}
