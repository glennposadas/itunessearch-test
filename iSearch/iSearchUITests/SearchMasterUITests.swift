//
//  SearchMasterUITests.swift
//  iSearchUITests
//
//  Created by Glenn Von Posadas on 4/11/20.
//  Copyright © 2020 CitusLabs. All rights reserved.
//

import XCTest

/**
 Tests for the `SearchMasterViewController`.
 */
class SearchMasterUITests: BaseUITestCase {
    /// Check all views visibility
    func testAllViewsVisibility() {
        let largeTitle = app.staticTexts["Track List"]
        wait(forElement: largeTitle, timeout: 25)
        
        // Static Texts - Tabs
        XCTAssert(largeTitle.exists)
        XCTAssert(app.staticTexts["Recents"].exists)
        XCTAssert(app.staticTexts["Downloads"].exists)
        XCTAssert(app.staticTexts["Search"].exists)
        XCTAssert(app.staticTexts["Featured"].exists)
        XCTAssert(app.staticTexts["More"].exists)
    }
}
