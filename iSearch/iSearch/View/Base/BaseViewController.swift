//
//  BaseViewController.swift
//  iSearch
//
//  Created by Glenn Von Posadas on 4/9/20.
//  Copyright © 2020 CitusLabs. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    // MARK: - Properties
    
    var backgroundColor: UIColor {
        get {
            self.view.backgroundColor ?? .white
        } set {
            self.view.backgroundColor = newValue
        }
    }
    
    // MARK: - Functions
    // MARK: Overrides
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.backgroundColor = .backgroundColor
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        self.navigationController?.navigationBar.largeTitleTextAttributes = [
            .font: UIFont.boldSystemFont(ofSize: 34.0),
            .foregroundColor: UIColor.textColor
        ]
    }
}
