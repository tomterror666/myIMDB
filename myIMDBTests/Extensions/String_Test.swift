//
//  String_Test.swift
//  myIMDBTests
//
//  Created by Andre Heß on 30.10.23.
//

import XCTest
@testable import myIMDB

final class String_Test: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCorrectHeightOfText() throws {
        guard let font = UIFont(name: "Chalkduster", size: 22) else { return }
        var string = "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet."
        var height = string.height(withConstrainedWidth: 320.0, font: font)
        XCTAssertEqual(height, 751.0)
        
        string = "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet."
        height = string.height(withConstrainedWidth: 320.0, font: font)
        XCTAssertEqual(height, 389.0)
        
        string = "Lorem ipsum dolor sit amet"
        height = string.height(withConstrainedWidth: 320.0, font: font)
        XCTAssertEqual(height, 56.0)
    }

}
