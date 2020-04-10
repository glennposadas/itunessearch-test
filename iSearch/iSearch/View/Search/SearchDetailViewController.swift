//
//  SearchDetailViewController.swift
//  iSearch
//
//  Created by Glenn Von Posadas on 4/9/20.
//  Copyright © 2020 CitusLabs. All rights reserved.
//

import Kingfisher
import RxCocoa
import RxSwift
import UIKit

/**
 The controller for Search detail screen.
 For now, this view is best fit for movies type.
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
    
    private lazy var label_Title: UILabel = {
        let label = UILabel()
        label.textColor = .textColor
        label.font = UIFont.boldSystemFont(ofSize: 20.0)
        label.numberOfLines = 2
        return label
    }()
    
    private lazy var label_GenreDate: UILabel = {
        let label = UILabel()
        label.textColor = .textColor
        label.font = UIFont.systemFont(ofSize: 14.0, weight: .regular)
        label.alpha = 0.8
        label.numberOfLines = 0
        return label
    }()

    private lazy var label_About: UILabel = {
        let label = UILabel()
        label.textColor = .textColor
        label.font = UIFont.systemFont(ofSize: 14.0, weight: .regular)
        label.alpha = 0.8
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var label_ContentRating: UILabel = {
        let label = UILabel()
        label.textColor = .textColor
        label.font = UIFont.systemFont(ofSize: 10.0, weight: .regular)
        label.setupLayer(cornerRadius: 0, borderWidth: 1.0, borderColor: .white)
        return label
    }()

    private lazy var button_Buy: GetButton = {
        return GetButton(type: .custom)
    }()

    private lazy var button_Rent: GetButton = {
        return GetButton(type: .custom)
    }()
    
    // MARK: - Functions
    
    private func setupBindings() {
        
    }
    
    private func setupUI() {
        self.addScrollView(to: self.view, shouldExtendToTopEdge: true) { (contentView, topConstraint) in
            contentView.addSubviews(
                self.imageView_Artwork,
                self.label_Title,
                self.label_ContentRating,
                self.label_GenreDate
            )
            
            self.imageView_Artwork.snp.makeConstraints {
                $0.top.leading.equalToSuperview().inset(16.0)
                $0.width.equalTo(130.0)
                $0.height.equalTo(250.0)
            }
            
            self.label_Title.snp.makeConstraints {
                $0.top.equalTo(self.imageView_Artwork).offset(8.0)
                $0.leading.equalTo(self.imageView_Artwork.snp.trailing).offset(8.0)
                $0.trailing.equalToSuperview().inset(16.0)
            }
            
            self.label_GenreDate.snp.makeConstraints {
                $0.top.equalTo(self.label_Title.snp.bottom)
                $0.leading.equalTo(self.label_Title)
            }
            
            self.label_GenreDate.snp.makeConstraints {
                $0.top.equalTo(self.label_GenreDate.snp.bottom).offset(8.0)
                $0.leading.equalTo(self.label_Title)
            }
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
