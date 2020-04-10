//
//  SearchDetailViewModel.swift
//  iSearch
//
//  Created by Glenn Von Posadas on 4/10/20.
//  Copyright © 2020 CitusLabs. All rights reserved.
//

/**
 Protocol of `SearchDetailViewModel`.
 */
protocol SearchDetailDelegate: BaseViewModelDelegate { }

/**
 The viewmodel that the `SearchDetailViewController` owns.
 */
class SearchDetailViewModel: BaseViewModel {
    
    // MARK: - Properties
    
    private weak var delegate: SearchDetailDelegate?
    
    // MARK: - Functions
    // MARK: Overrides
    
    init(searchDetailController: SearchDetailDelegate?) {
        
    }
}
