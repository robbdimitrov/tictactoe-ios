//
//  HistoryViewController.swift
//  TicTacToe
//
//  Created by Robert Dimitrov on 1.03.18.
//  Copyright © 2018 Robert Dimitrov. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class HistoryViewController: BaseViewController<HistoryViewModel> {
 
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var noGamesLabel: UILabel!
    
    override func setup() {
        super.setup()
        
        viewModel?.data.asObservable()
            .bind(to: collectionView.rx.items(cellIdentifier: HistoryCell.cellIdentifier,
                                              cellType: HistoryCell.self))({ [weak self] (index, _, cell) in
            cell.viewModel = self?.viewModel?.viewModel(forCell: index)
        }).disposed(by: disposeBag)
        
        viewModel?.data.map { (data) -> Bool in
            return data.count > 0
        }.bind(to: noGamesLabel.rx.isHidden)
            .disposed(by: disposeBag)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        (collectionView.collectionViewLayout as? UICollectionViewFlowLayout)?.itemSize =
            CGSize(width: collectionView.frame.width, height: 100)
    }
    
}
