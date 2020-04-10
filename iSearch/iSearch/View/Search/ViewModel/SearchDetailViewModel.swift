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
    private var selectedResult: Result?
    
    // MARK: - Functions
    // MARK: Overrides
    
    init(searchDetailController: SearchDetailDelegate?, selectedResult: Result?) {
        super.init()
        self.selectedResult = selectedResult
    }
    
    /// A controller lifecycle method
    func viewWillDisappear() {
        // Reset the defaults.
        AppDefaults.removeDefaultsWithKey(.lastViewedResult)
    }
}
