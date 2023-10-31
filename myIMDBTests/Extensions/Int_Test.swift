//
//  Int_Test.swift
//  myIMDBTests
//
//  Created by Andre Heß on 30.10.23.
//

import XCTest
@testable import myIMDB

final class Int_Test: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCorrectSeparatorForIntValues() throws {
        var value: Int = 1200
        XCTAssertEqual("\(value.withSeparator)", "1.200")
        value = 12
        XCTAssertEqual("\(value.withSeparator)", "12")
        value = 1200000
        XCTAssertEqual("\(value.withSeparator)", "1.200.000")
    }

}
