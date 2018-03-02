//
//  BaseViewController.swift
//  TicTacToe
//
//  Created by Robert Dimitrov on 1.03.18.
//  Copyright © 2018 Robert Dimitrov. All rights reserved.
//

import UIKit
import RxSwift

class BaseViewController<T: ViewModel>: UIViewController {
    
    var disposeBag = DisposeBag()
    
    var viewModel: T? {
        didSet {
            setup()
            updateUI()
        }
    }
    
    func setup() {
        disposeBag = DisposeBag()
        // Implemented by subclasses
    }
    
    func updateUI() {
        // Implemented by subclasses
    }
    
}
