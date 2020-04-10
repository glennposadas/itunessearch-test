//
//  BaseViewController.swift
//  iSearch
//
//  Created by Glenn Von Posadas on 4/9/20.
//  Copyright © 2020 CitusLabs. All rights reserved.
//

import SnapKit
import UIKit

class BaseViewController: UIViewController {

    // MARK: - Properties
    
    var backgroundColor: UIColor {
        get {
            self.view.backgroundColor ?? .backgroundColor
        } set {
            self.view.backgroundColor = newValue
        }
    }
    
    lazy var tableView: BaseTableView = {
        let tableView = BaseTableView(frame: .zero, style: .plain)
        tableView.backgroundColor = .clear
        return tableView
    }()

    lazy var view_ActivityIndicatorContainer: UIView = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12.0)
        label.textColor = .textColor
        label.text = "LOADING"
        
        let activityIndicator = UIActivityIndicatorView(style: .medium)
        activityIndicator.startAnimating()
        activityIndicator.tintColor = .textColor
        
        let view = UIView.new(backgroundColor: .clear, isHidden: true)
        view.addSubviews(label, activityIndicator)
        
        activityIndicator.snp.makeConstraints {
            $0.top.centerX.equalToSuperview()
        }
        
        label.snp.makeConstraints {
            $0.top.equalTo(activityIndicator.snp.bottom).offset(8.0)
            $0.centerX.equalToSuperview()
        }
        
        return view
    }()
    
    // MARK: - Functions
    
    func layoutActivityIndicator() {
        self.view.addSubview(self.view_ActivityIndicatorContainer)
        self.view_ActivityIndicatorContainer.snp.makeConstraints {
            $0.centerY.leading.trailing.equalToSuperview()
            $0.height.equalTo(50.0)
        }
    }
        
    // MARK: Overrides
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.layoutActivityIndicator()
        
        self.navigationItem.largeTitleDisplayMode = .automatic
        
        self.navigationController?.navigationBar.largeTitleTextAttributes = [
            .font: UIFont.boldSystemFont(ofSize: 34.0),
            .foregroundColor: UIColor.textColor
        ]
    }
}
