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
        XCTAssert(app.tabBars.buttons["Recents"].exists)
        XCTAssert(app.tabBars.buttons["Downloads"].exists)
        XCTAssert(app.tabBars.buttons["Search"].exists)
        XCTAssert(app.tabBars.buttons["Featured"].exists)
        XCTAssert(app.tabBars.buttons["More"].exists)
    }
}
