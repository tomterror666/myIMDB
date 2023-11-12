//
//  baseUITests.swift
//  baseUITests
//
//  Created by Andre Heß on 27.10.23.
//

import XCTest

final class baseUITests: XCTestCase {
    
    var app: XCUIApplication?

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
        app = XCUIApplication()
        
        app?.launchArguments = ["enable-testing"]
        app?.launch()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func startTests() {
        guard let app = app else { return }
        
        app.buttons["menu_button"].tap()
        XCTAssertTrue(app.navigationBars["Menu"].waitForExistence(timeout: 1))
        
        app.cells["1"].tap()
        XCTAssertTrue(app.tables.element.waitForExistence(timeout: 3))
    }

    // MARK: - test methods
    
    func testAppMenu() throws {
        guard let app = app else { return }
        
        app.buttons["menu_button"].tap()
        XCTAssertTrue(app.navigationBars["Menu"].waitForExistence(timeout: 1))
        
        XCTAssertTrue(app.cells["0"].staticTexts["Home"].exists)
        XCTAssertTrue(app.cells["1"].staticTexts["StarWars"].exists)
        
        app.cells["0"].tap()
        XCTAssertTrue(app.navigationBars["Home"].waitForExistence(timeout: 1))
    }
    
    func testOpenStarwars() throws {
        guard let app = app else { return }
        
        startTests()
        
        XCTAssertEqual(app.cells.count, 6)
        XCTAssertTrue(app.cells["0"].staticTexts["A New Hope"].exists)
        XCTAssertTrue(app.cells["1"].staticTexts["The Empire Strikes Back"].exists)
        XCTAssertTrue(app.cells["2"].staticTexts["Return of the Jedi"].exists)
        XCTAssertTrue(app.cells["3"].staticTexts["The Phantom Menace"].exists)
        XCTAssertTrue(app.cells["4"].staticTexts["Attack of the Clones"].exists)
        XCTAssertTrue(app.cells["5"].staticTexts["Revenge of the Sith"].exists)
    }
    
    func testOpenCharacterDetails() {
        guard let app = app else { return }
        
        startTests()
        
        app.cells["3"].tap()
        sleep(1)
        XCTAssertEqual(app.cells.count, 11)
        app.cells["1"].tap()
        XCTAssertTrue(app.navigationBars["Characters"].waitForExistence(timeout: 1))
        XCTAssertEqual(app.cells.count, 1)
        app.cells["0"].tap()
        XCTAssertTrue(app.navigationBars["C-3PO"].waitForExistence(timeout: 1))
        XCTAssertEqual(app.cells.count, 14)
        XCTAssertTrue(app.cells["0"].staticTexts["167 cm"].exists)
        XCTAssertTrue(app.cells["1"].staticTexts["75 Kg"].exists)
        XCTAssertTrue(app.cells["2"].staticTexts["n/a"].exists)
        XCTAssertTrue(app.cells["3"].staticTexts["gold"].exists)
        app.cells["9"].tap()
        XCTAssertTrue(app.navigationBars["Planets"].waitForExistence(timeout: 1))
        XCTAssertEqual(app.cells.count, 1)
    }
    
    func testOpenPlanetDetails() {
        guard let app = app else { return }
            
        startTests()
            
        app.cells["3"].tap()
        sleep(1)
        XCTAssertEqual(app.cells.count, 11)
        app.cells["2"].tap()
        XCTAssertTrue(app.navigationBars["Planets"].waitForExistence(timeout: 1))
        XCTAssertEqual(app.cells.count, 1)
        app.cells["0"].tap()
        XCTAssertTrue(app.navigationBars["Tatooine"].waitForExistence(timeout: 1))
        XCTAssertEqual(app.cells.count, 12)
        XCTAssertTrue(app.cells["0"].staticTexts["23 hours"].exists)
        XCTAssertTrue(app.cells["1"].staticTexts["304 days"].exists)
        XCTAssertTrue(app.cells["2"].staticTexts["10.465 km"].exists)
        XCTAssertTrue(app.cells["3"].staticTexts["arid"].exists)
        app.cells["10"].tap()
        XCTAssertTrue(app.navigationBars["Characters"].waitForExistence(timeout: 1))
        XCTAssertEqual(app.cells.count, 1)
    }
    
    func testOpenSpeciesDetails() {
        guard let app = app else { return }
            
        startTests()
            
        app.cells["3"].tap()
        sleep(1)
        XCTAssertEqual(app.cells.count, 11)
        app.cells["3"].tap()
        XCTAssertTrue(app.navigationBars["Species"].waitForExistence(timeout: 1))
        XCTAssertEqual(app.cells.count, 1)
        app.cells["0"].tap()
        XCTAssertTrue(app.navigationBars["Human"].waitForExistence(timeout: 1))
        XCTAssertEqual(app.cells.count, 13)
        XCTAssertTrue(app.cells["0"].staticTexts["mammal"].exists)
        XCTAssertTrue(app.cells["1"].staticTexts["sentient"].exists)
        XCTAssertTrue(app.cells["2"].staticTexts["180 cm"].exists)
        XCTAssertTrue(app.cells["3"].staticTexts["caucasian, black, asian, hispanic"].exists)
        app.cells["10"].tap()
        XCTAssertTrue(app.navigationBars["Planets"].waitForExistence(timeout: 1))
        XCTAssertEqual(app.cells.count, 1)
    }
    
    func testOpenStarshipDetails() {
        guard let app = app else { return }
            
        startTests()
            
        app.cells["3"].tap()
        sleep(1)
        XCTAssertEqual(app.cells.count, 11)
        app.cells["4"].tap()
        XCTAssertTrue(app.navigationBars["Starships"].waitForExistence(timeout: 1))
        XCTAssertEqual(app.cells.count, 1)
        app.cells["0"].tap()
        XCTAssertTrue(app.navigationBars["Republic Cruiser"].waitForExistence(timeout: 1))
        XCTAssertEqual(app.cells.count, 16)
        XCTAssertTrue(app.cells["0"].staticTexts["Consular-class cruiser"].exists)
        XCTAssertTrue(app.cells["1"].staticTexts["Corellian Engineering Corporation"].exists)
        XCTAssertTrue(app.cells["2"].staticTexts["unknown"].exists)
        XCTAssertTrue(app.cells["3"].staticTexts["115.0 m"].exists)
        app.cells["15"].tap()
        XCTAssertTrue(app.navigationBars["StarWars"].waitForExistence(timeout: 1))
        XCTAssertEqual(app.cells.count, 1)
    }
    
    func testOpenVehicleDetails() {
        guard let app = app else { return }
            
        startTests()
            
        app.cells["3"].tap()
        sleep(1)
        XCTAssertEqual(app.cells.count, 11)
        app.cells["5"].tap()
        XCTAssertTrue(app.navigationBars["Vehicles"].waitForExistence(timeout: 1))
        XCTAssertEqual(app.cells.count, 1)
        app.cells["0"].tap()
        XCTAssertTrue(app.navigationBars["Vulture Droid"].waitForExistence(timeout: 1))
        XCTAssertEqual(app.cells.count, 14)
        XCTAssertTrue(app.cells["0"].staticTexts["Vulture-class droid starfighter"].exists)
        XCTAssertTrue(app.cells["1"].staticTexts["Haor Chall Engineering, Baktoid Armor Workshop"].exists)
        XCTAssertTrue(app.cells["2"].staticTexts["unknown"].exists)
        XCTAssertTrue(app.cells["3"].staticTexts["3.5 m"].exists)
        app.cells["13"].tap()
        XCTAssertTrue(app.navigationBars["StarWars"].waitForExistence(timeout: 1))
        XCTAssertEqual(app.cells.count, 1)
    }
    
    func testShowInfoForEmptyListElement() {
        guard let app = app else { return }
            
        startTests()
            
        app.cells["3"].tap()
        sleep(1)
        XCTAssertEqual(app.cells.count, 11)
        app.cells["1"].tap()
        XCTAssertTrue(app.navigationBars["Characters"].waitForExistence(timeout: 1))
        XCTAssertEqual(app.cells.count, 1)
        app.cells["0"].tap()
        XCTAssertTrue(app.navigationBars["C-3PO"].waitForExistence(timeout: 1))
        app.cells["12"].tap()
        XCTAssertEqual(app.otherElements["InfoView"].staticTexts["InfoViewMessageLabel"].label, "Vehicle list is empty!")
    }

    /*func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }*/
}
