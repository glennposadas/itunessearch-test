//
//  SearchDetailViewModel.swift
//  iSearch
//
//  Created by Glenn Von Posadas on 4/10/20.
//  Copyright © 2020 CitusLabs. All rights reserved.
//

import Foundation
import Kingfisher
import RxCocoa
import RxSwift

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
    
    var artworkResource = BehaviorRelay<Resource?>(value: nil)
    var trackTitlePresentable = BehaviorRelay<String>(value: "")
    var genreDatePresentable = BehaviorRelay<String>(value: "")
    var aboutPresentable = BehaviorRelay<String>(value: "")
    var contentRatingPresentable = BehaviorRelay<String>(value: "")
    
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
