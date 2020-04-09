//
//  SearchMasterViewController.swift
//  iSearch
//
//  Created by Glenn Von Posadas on 4/9/20.
//  Copyright © 2020 CitusLabs. All rights reserved.
//

import UIKit

class SearchMasterViewController: BaseViewController {

    // MARK: - Properties
    
    // MARK: - Functions
    
    private func setupUI() {
        self.title = "Track List"
    }
    
    // MARK: Overrides
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setupUI()        
    }
}
