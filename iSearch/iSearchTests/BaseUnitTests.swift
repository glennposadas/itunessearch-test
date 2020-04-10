//
//  BaseUnitTests.swift
//  iSearchTests
//
//  Created by Glenn Von Posadas on 4/11/20.
//  Copyright © 2020 CitusLabs. All rights reserved.
//

import XCTest
@testable import iSearch

class BaseUnitTests: XCTestCase {

    // MARK: - Properties
    
    var viewModel: SearchMasterViewModel!
    var mockDelegate: MockSearchMasterDelegate!
    
    // MARK: - Functions
    // MARK: Overrides
    
    override func setUp() {
        self.mockDelegate = MockSearchMasterDelegate()
        self.viewModel = SearchMasterViewModel(searchMasterController: self.mockDelegate)
    }
}
