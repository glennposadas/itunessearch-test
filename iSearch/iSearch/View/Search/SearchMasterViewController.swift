//
//  SearchMasterViewController.swift
//  iSearch
//
//  Created by Glenn Von Posadas on 4/9/20.
//  Copyright © 2020 CitusLabs. All rights reserved.
//

import RxCocoa
import RxSwift
import UIKit

/**
 The controller for the Search master screen.
 */
class SearchMasterViewController: BaseViewController {
    
    // MARK: - Properties
    
    private var viewModel: SearchMasterViewModel!
    private let disposeBag = DisposeBag()
    
    // MARK: - Functions
    
    private func setupBindings() {
        self.viewModel.loaderIsHidden
            .bind(to: self.view_ActivityIndicatorContainer.rx.isHidden)
            .disposed(by: self.disposeBag)
    }
    
    private func setupUI() {
        self.title = "Track List"
    }
    
    // MARK: Overrides
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.viewModel = SearchMasterViewModel(searchMasterController: self)
        self.setupUI()
        self.setupBindings()
    }
}

// MARK: - SearchMasterDelegate

extension SearchMasterViewController: SearchMasterDelegate {
    func reloadData() {
        
    }
}
