//
//  SearchMasterViewModel.swift
//  iSearch
//
//  Created by Glenn Von Posadas on 4/10/20.
//  Copyright © 2020 CitusLabs. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

/**
 Protocol of `SearchMasterViewModel`.
 */
protocol SearchMasterDelegate: BaseViewModelDelegate { }

/**
 The viewmodel that the `SearchMasterViewController` owns.
 */
class SearchMasterViewModel: BaseViewModel {
    
    // MARK: - Properties
    
    private weak var delegate: SearchMasterDelegate?
    
    // MARK: - Functions
    // MARK: Overrides
    init(searchMasterController: SearchMasterDelegate?) {
        
    }
}
