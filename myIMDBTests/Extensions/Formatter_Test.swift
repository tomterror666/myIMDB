//
//  Formatter_Test.swift
//  myIMDBTests
//
//  Created by Andre Heß on 30.10.23.
//

import XCTest
@testable import myIMDB

final class Formatter_Test: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGeneratingFormmatterWithSeparator() throws {
        let formatter = Formatter.withSeparator
        XCTAssertTrue(formatter.groupingSeparator == Locale.current.groupingSeparator)
        XCTAssertTrue(formatter.numberStyle == .decimal)
    }

}
