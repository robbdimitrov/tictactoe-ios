//
//  HistoryCell.swift
//  TicTacToe
//
//  Created by Robert Dimitrov on 1.03.18.
//  Copyright © 2018 Robert Dimitrov. All rights reserved.
//

import UIKit

class HistoryCell: UICollectionViewCell {

    @IBOutlet var winnerLabel: UILabel!
    @IBOutlet var turnsLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    var viewModel: HistoryCellViewModelType? {
        didSet {
            updateUI()
        }
    }
    
    override func prepareForReuse() {
        winnerLabel.text = ""
        turnsLabel.text = ""
        dateLabel.text = ""
        super.prepareForReuse()
    }
    
    func updateUI() {
        guard let viewModel = viewModel else {
            print("[HistoryCell] Error: ViewModel is missing")
            return
        }
        winnerLabel.text = viewModel.winnerText
        turnsLabel.text = viewModel.turnsText
        dateLabel.text = viewModel.dateText
    }
    
    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        let autoLayoutAttributes = super.preferredLayoutAttributesFitting(layoutAttributes)
        
        let origin = layoutAttributes.frame.origin
        let targetSize = CGSize(width: layoutAttributes.frame.width, height: 0)
        
        let horizontalFittingPriority = UILayoutPriority.required
        let verticalFittingPriority = UILayoutPriority.defaultLow
        
        let autoLayoutSize = contentView.systemLayoutSizeFitting(targetSize, withHorizontalFittingPriority: horizontalFittingPriority,
                                                             verticalFittingPriority: verticalFittingPriority)
        
        autoLayoutAttributes.frame = CGRect(origin: origin, size: autoLayoutSize)
        
        return autoLayoutAttributes
    }
    
}
