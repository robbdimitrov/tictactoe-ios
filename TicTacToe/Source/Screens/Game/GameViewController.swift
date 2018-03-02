//
//  GameViewController.swift
//  TicTacToe
//
//  Created by Robert Dimitrov on 1.03.18.
//  Copyright © 2018 Robert Dimitrov. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class GameViewController: BaseViewController<GameViewModel> {
    
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var winnerLabel: UILabel!
    @IBOutlet var resetButton: UIButton!
    @IBOutlet var historyButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "TicTacToc"
        
        setup()
    }
    
    override func setup() {
        guard let collectionView = collectionView else {
            return
        }
        
        super.setup()
        
        viewModel?.gameFinished.asObservable().map({ (finished) -> Bool in
            return !finished
        }).bind(to: winnerLabel.rx.isHidden)
            .disposed(by: disposeBag)
        
        viewModel?.gameWinner.asObservable().map({ (player) -> String in
            "Player \(player.name) won."
        }).bind(to: winnerLabel.rx.text).disposed(by: disposeBag)
        
        viewModel?.grid.asObservable()
            .bind(to: collectionView.rx.items(
                cellIdentifier: GameCell.cellIdentifier,
                cellType: GameCell.self))({ [weak self] (index, _, cell) in
            cell.viewModel = self?.viewModel?.cellViewModel(for: index)
        }).disposed(by: disposeBag)
        
        collectionView.rx.itemSelected.asObservable().bind { [weak self] (indexPath) in
            if self?.viewModel?.selectedCell(at: indexPath) == true {
                let cell = collectionView.cellForItem(at: indexPath)
                (cell as? GameCell)?.viewModel = self?.viewModel?.cellViewModel(for: indexPath.row)
            }
        }.disposed(by: disposeBag)
    }
    
}
