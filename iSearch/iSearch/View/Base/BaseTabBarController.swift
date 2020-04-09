//
//  BaseTabBarController.swift
//  iSearch
//
//  Created by Glenn Von Posadas on 4/9/20.
//  Copyright © 2020 CitusLabs. All rights reserved.
//

import UIKit

class BaseTabBarController: UITabBarController {

    lazy var splitController: BaseSplitViewController = {
        let splitViewController =  BaseSplitViewController()
        splitViewController.delegate = self
        let masterVC = SearchMasterViewController()
        let detailVC = SearchDetailViewController()
        let masterNavController = UINavigationController(rootViewController: masterVC)
        let detailNavController = UINavigationController(rootViewController: detailVC)
        splitViewController.viewControllers = [masterNavController,detailNavController]
        splitViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
        return splitViewController
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.delegate = self
        
        self.viewControllers = [
            self.splitController
        ]
    }
}

// MARK: - UITabBarControllerDelegate

extension BaseTabBarController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        return true
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        
    }
}

// MARK: - UISplitViewControllerDelegate

extension BaseTabBarController: UISplitViewControllerDelegate {
    func splitViewController(
        _ splitViewController: UISplitViewController,
        collapseSecondary secondaryViewController: UIViewController,
        onto primaryViewController: UIViewController) -> Bool {
        return true
    }
}
