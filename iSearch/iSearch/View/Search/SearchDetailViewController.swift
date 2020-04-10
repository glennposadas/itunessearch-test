//
//  SearchDetailViewController.swift
//  iSearch
//
//  Created by Glenn Von Posadas on 4/9/20.
//  Copyright © 2020 CitusLabs. All rights reserved.
//

import RxCocoa
import RxSwift
import UIKit

/**
 The controller for Search detail screen.
 */
class SearchDetailViewController: BaseViewController {

    // MARK: - Properties
    
    /// The object used in `BaseSplitViewController`.
    /// Used for handling collapse.
    /// Can be moved to viewModel in the future.
    var hasData: Bool = false

    private var viewModel: SearchDetailViewModel!
    private let disposeBag = DisposeBag()
    
    private lazy var imageView_Artwork: UIImageView = {
        return UIImageView(image: UIImage(named: "ic_placeholder"))
    }()
    
    // MARK: - Functions
    
    private func setupBindings() { }
    
    private func setupUI() {
        self.addScrollView(to: self.view, shouldExtendToTopEdge: true) { (contentView, topConstraint) in
            contentView.addSubviews(
                
            )
        }
    }

    // MARK: - Initialization
    
    init(selectedResult: Result?) {
        super.init(nibName: nil, bundle: nil)
     
        self.hasData = selectedResult != nil
        self.viewModel = SearchDetailViewModel(searchDetailController: self, selectedResult: selectedResult)
    }
    
    private init() { super.init(nibName: nil, bundle: nil) }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Overrides

    override func loadView() {
        super.loadView()

        self.setupUI()
        self.setupBindings()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        self.viewModel.viewWillDisappear()
    }
}

// MARK: - SearchDetailDelegate

extension SearchDetailViewController: SearchDetailDelegate { }
