//
//  Identifiers.swift
//  TicTacToe
//
//  Created by Robert Dimitrov on 1.03.18.
//  Copyright © 2018 Robert Dimitrov. All rights reserved.
//

import UIKit

extension UIView {
    
    class var cellIdentifier: String {
        return String(describing: self)
    }
    
}

extension UIViewController {
    
    class var identifier: String {
        return String(describing: self)
    }
    
}
