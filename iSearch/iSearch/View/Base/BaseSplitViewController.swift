//
//  BaseSplitViewController.swift
//  iSearch
//
//  Created by Glenn Von Posadas on 4/9/20.
//  Copyright © 2020 CitusLabs. All rights reserved.
//

import UIKit

class BaseSplitViewController: UISplitViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.preferredDisplayMode = .allVisible
    }
}
