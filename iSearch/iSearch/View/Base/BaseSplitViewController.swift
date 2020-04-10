//
//  BaseSplitViewController.swift
//  iSearch
//
//  Created by Glenn Von Posadas on 4/9/20.
//  Copyright © 2020 CitusLabs. All rights reserved.
//

import UIKit

/**
 The base split controller, intended to for Search tab.
 Should other tabs need to use this, then handle delegate properly.
 */
class BaseSplitViewController: UISplitViewController, UISplitViewControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.preferredDisplayMode = .allVisible
        self.delegate = self
    }
    
    func splitViewController(_ splitViewController: UISplitViewController,
                             collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
        /*if let navCon = secondaryViewController as? UINavigationController,
            let detail = navCon.topViewController as? SearchDetailViewController,
            !detail.hasData {
            return true
        }
        
        return false*/
        return true
    }
}
