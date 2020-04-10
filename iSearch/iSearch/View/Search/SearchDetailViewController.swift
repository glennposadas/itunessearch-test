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
    var hasData: Bool = false

    private var viewModel: SearchDetailViewModel!
    private let disposeBag = DisposeBag()
    
    // MARK: - Functions
    
    private func setupBindings() { }
    
//    private func setupUI() {
//        weak var weakSelf = self
//
//        self.title = "Track List"
//        self.navigationController?.navigationBar.prefersLargeTitles = true
//
//        self.view.addSubview(self.tableView)
//        self.tableView.snp.makeConstraints {
//            $0.edges.equalToSuperview()
//        }
//
//        self.addPullToRefreshControl(to: self.tableView)
//
//        self.refreshControl.rx.controlEvent(.valueChanged)
//            .map { _ in
//                weakSelf?.refreshControl.isRefreshing == false
//        }
//        .filter { $0 == false }
//        .subscribe(onNext: { _ in
//            weakSelf?.viewModel.refresh()
//        }).disposed(by: self.disposeBag)
//
//        self.refreshControl.rx.controlEvent(.valueChanged)
//            .map { _ in
//                weakSelf?.refreshControl.isRefreshing == true
//        }
//        .filter { $0 == true }
//        .subscribe(onNext: { _ in
//            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1)) {
//                weakSelf?.refreshControl.endRefreshing()
//            }
//        }).disposed(by: self.disposeBag)
//    }
//
//    // MARK: Overrides
//
//    override func loadView() {
//        super.loadView()
//
//        self.viewModel = SearchMasterViewModel(searchMasterController: self)
//        self.setupUI()
//        self.setupBindings()
//    }
}
