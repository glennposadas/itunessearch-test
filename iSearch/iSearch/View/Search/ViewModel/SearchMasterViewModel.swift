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
    
    // MARK: - Functions
    
    /// Do searching... call `SearchService`.
    private func search(_ term: String, country: String, media: String) {
        searchProvider.request(.search(term: term, country: country, media: media)) { (result) in
            switch result {
            case let .success(response):
                let data = response.data
                
                if response.statusCode == 200 {
                    onSuccess?(jsonObj)
                    return
                }
                
                // Error handling is inconsistent in API side.
                // the jsonObj contains `error` keys if it's for auth, and if for the others, it contains `code`.
                let llfErrorCode = (jsonObj["code"].string ?? jsonObj["error"].string) ?? ""
                
                // Return the parsed error message from `LLFError`.
                if LLFError(value: llfErrorCode).errorMessagePresentable != LLFError.defaultMessage {
                    let errorMessagePresentable = LLFError(value: llfErrorCode).errorMessagePresentable
                    onError?(errorMessagePresentable, response.statusCode, llfErrorCode)
                    return
                }
                
                // Return the message from server if there's no parsed error message from `LLFError`.
                if let message = jsonObj["message"].string {
                    onError?(message, response.statusCode, llfErrorCode)
                    return
                }
                
                if let errorDescription = jsonObj["error_description"].string {
                    onError?(errorDescription, response.statusCode, llfErrorCode)
                    return
                }
                
                // Return a generic error message if none of the above conditions are true.
                onError?(LLFError.defaultMessage, response.statusCode, llfErrorCode)
                
            case let .failure(error):
                UIViewController.current()?.alert(title: <#T##String#>, okayButtonTitle: <#T##String#>, withBlock: <#T##UIViewController.AlertCallBack?##UIViewController.AlertCallBack?##(Bool) -> Void#>)
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
