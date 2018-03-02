//
//  DateFormatter.swift
//  TicTacToe
//
//  Created by Robert Dimitrov on 2.03.18.
//  Copyright © 2018 Robert Dimitrov. All rights reserved.
//

import Foundation

extension DateFormatter {
    
    static var shared: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = .short
        dateFormatter.dateStyle = .medium
        dateFormatter.doesRelativeDateFormatting = true
        return dateFormatter
    }()
    
}
