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
    
    private var mediaType = "movie"
    private weak var delegate: SearchMasterDelegate?
    
    private var searchResult: SearchResult?
    
    // MARK: - Functions
    
    /// Do searching... call `SearchService`.
    private func search(_ term: String, country: String, media: String) {
        searchProvider.request(.search(term: term, country: country, media: media)) { (result) in
            switch result {
            case let .success(response):
                if response.statusCode == 200,
                    let searchResult = try? JSONDecoder().decode(SearchResult.self, from: response.data) {
                    self.searchResult = searchResult
                    self.delegate?.reloadData()
                    return
                }

                // TODO: handle error further...
                self.showError("Data error")
                
            case let .failure(error):
                self.showError(error.localizedDescription)
            }
        }
    }
    
    // MARK: Overrides
    
    init(searchMasterController: SearchMasterDelegate?) {
        super.init()
        
        self.delegate = searchMasterController
        self.search("star", country: AppConfig.country, media: self.mediaType)
    }
}
