//
//  InterfaceInstantiation.swift
//  TicTacToe
//
//  Created by Robert Dimitrov on 1.03.18.
//  Copyright © 2018 Robert Dimitrov. All rights reserved.
//

import UIKit

extension UIStoryboard {
    
    func instantiateViewController<T: UIViewController>() -> T {
        let controller = instantiateViewController(withIdentifier: T.identifier) as! T
        return controller
    }
    
}
