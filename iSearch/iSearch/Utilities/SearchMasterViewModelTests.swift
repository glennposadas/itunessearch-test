//
//  SearchMasterViewModelTests.swift
//  iSearchTests
//
//  Created by Glenn Von Posadas on 4/11/20.
//  Copyright © 2020 CitusLabs. All rights reserved.
//

import XCTest

class SearchMasterViewModelTests: BaseUnitTests {
    func testMockDelegate() {
        XCTAssert(self.mockDelegate.reloadDataWasCalled == true, "After viewModel init, the reload data must be called.")
    }
    
    func testDidSelect() {
        self.viewModel.tableView(UITableView(), didSelectRowAt: IndexPath(row: 0, section: 0))
        XCTAssert(self.mockDelegate.showDetailWasCalled == true, "After viewModel init, the showDetail() must be called.")
        
        let storedDefaultsObject = AppDefaults.getObjectWithKey(.lastViewedResult, type: Result.self)
        XCTAssertNotNil(storedDefaultsObject, "after didSelect, there must be a stored object in the defaults with key lastViewedResult")
    }
}
