//
//  SearchMasterViewController.swift
//  iSearch
//
//  Created by Glenn Von Posadas on 4/9/20.
//  Copyright © 2020 CitusLabs. All rights reserved.
//

import UIKit

/**
 The controller for the Search master screen.
 */
class SearchMasterViewController: BaseViewController {

    // MARK: - Properties
    
    private var viewModel: SearchMasterViewModel!
    
    // MARK: - Functions
    
    private func setupBindings() {
        
    }
    
    private func setupUI() {
        self.title = "Track List"
        self.layoutActivityIndicator()
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
