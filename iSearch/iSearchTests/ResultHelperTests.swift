//
//  ResultHelperTests.swift
//  iSearchTests
//
//  Created by Glenn Von Posadas on 4/10/20.
//  Copyright © 2020 CitusLabs. All rights reserved.
//

import XCTest
@testable import iSearch

/**
 Tests `ResultHelper`
 */
class ResultHelperTests: XCTestCase {
    func testLocale() {
        let country = "en_us"
        let locale = Locale(identifier: country)
        let currencySymbol = locale.currencySymbol
        XCTAssert(currencySymbol == "$", "currency symbol for USA is $")
    }
}
