//
//  GameCell.swift
//  TicTacToe
//
//  Created by Robert Dimitrov on 1.03.18.
//  Copyright © 2018 Robert Dimitrov. All rights reserved.
//

import UIKit

class GameCell: UICollectionViewCell {
    
    @IBOutlet var textLabel: UILabel!
    var viewModel: GameCellViewModelType? {
        didSet {
            updateUI()
        }
    }
 
    override func prepareForReuse() {
        textLabel.text = ""
        super.prepareForReuse()
    }
    
    func updateUI() {
        textLabel.text = viewModel?.value
    }
    
}
