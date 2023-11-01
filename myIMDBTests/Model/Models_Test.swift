//
//  Models_Test.swift
//  myIMDBTests
//
//  Created by Andre Heß on 31.10.23.
//

import XCTest
@testable import myIMDB

final class Models_Test: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGeneratingCharacterCorrectlyByJSON() throws {
        let bundlePath = Bundle.main.path(forResource: "people_2", ofType: "tail")
        XCTAssertNotNil(bundlePath)
        do {
            let jsonData = try NSData(contentsOfFile: bundlePath!) as Data
            let json = try JSONSerialization.jsonObject(with: jsonData) as! [String: Any]
            let character = Character(with: json)
            XCTAssertEqual(character.name, "C-3PO")
            XCTAssertEqual(character.height, 167)
            XCTAssertEqual(character.mass, 75)
            XCTAssertEqual(character.hairColor, "n/a")
            XCTAssertEqual(character.skinColor, "gold")
            XCTAssertEqual(character.eyeColor, "yellow")
            XCTAssertEqual(character.birthYear, "112BBY")
            XCTAssertEqual(character.gender, "n/a")
            XCTAssertEqual(character.homeworld, ["1"])
            XCTAssertEqual(character.films, ["1", "2", "3", "4", "5", "6"])
            XCTAssertEqual(character.species, ["2"])
            XCTAssertEqual(character.vehicles, [])
            XCTAssertEqual(character.starships, [])
            XCTAssertEqual(character.createdAt, "2014-12-10T15:10:51.357000Z")
            XCTAssertEqual(character.editedAt, "2014-12-20T21:17:50.309000Z")
            XCTAssertEqual(character.url, "https://swapi.dev/api/people/2/")
        } catch {
            XCTAssertTrue(false)
        }
    }
    
    func testGeneratingCharacterCorrectlyByFalseJSON() throws {
        let character = Character(with: [:])
        XCTAssertEqual(character.name, "")
        XCTAssertEqual(character.height, 0)
        XCTAssertEqual(character.mass, 0)
        XCTAssertEqual(character.hairColor, "")
        XCTAssertEqual(character.skinColor, "")
        XCTAssertEqual(character.eyeColor, "")
        XCTAssertEqual(character.birthYear, "")
        XCTAssertEqual(character.gender, "")
        XCTAssertEqual(character.homeworld, [])
        XCTAssertEqual(character.films, [])
        XCTAssertEqual(character.species, [])
        XCTAssertEqual(character.vehicles, [])
        XCTAssertEqual(character.starships, [])
        XCTAssertEqual(character.createdAt, "")
        XCTAssertEqual(character.editedAt, "")
        XCTAssertEqual(character.url, "")
    }
    
    func testGeneratingFilmCorrectlyByJSON() throws {
        let bundlePath = Bundle.main.path(forResource: "films_4", ofType: "tail")
        XCTAssertNotNil(bundlePath)
        do {
            let jsonData = try NSData(contentsOfFile: bundlePath!) as Data
            let json = try JSONSerialization.jsonObject(with: jsonData) as! [String: Any]
            let film = Film(with: json)
            XCTAssertEqual(film.title, "The Phantom Menace")
            XCTAssertEqual(film.openingCrawl, "Turmoil has engulfed the\r\nGalactic Republic. The taxation\r\nof trade routes to outlying star\r\nsystems is in dispute.\r\n\r\nHoping to resolve the matter\r\nwith a blockade of deadly\r\nbattleships, the greedy Trade\r\nFederation has stopped all\r\nshipping to the small planet\r\nof Naboo.\r\n\r\nWhile the Congress of the\r\nRepublic endlessly debates\r\nthis alarming chain of events,\r\nthe Supreme Chancellor has\r\nsecretly dispatched two Jedi\r\nKnights, the guardians of\r\npeace and justice in the\r\ngalaxy, to settle the conflict....")
            XCTAssertEqual(film.director, "George Lucas")
            XCTAssertEqual(film.producers, "Rick McCallum")
            XCTAssertEqual(film.releaseDate, "1999-05-19")
            XCTAssertEqual(film.characters, ["2", "3", "10", "11", "16", "20", "21", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59"])
            XCTAssertEqual(film.planets, ["1", "8", "9"])
            XCTAssertEqual(film.species, ["1", "2", "6", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27"])
            XCTAssertEqual(film.vehicles, ["33", "34", "35", "36", "37", "38", "42"])
            XCTAssertEqual(film.starships, ["31", "32", "39", "40", "41"])
            XCTAssertEqual(film.createdAt, "2014-12-19T16:52:55.740000Z")
            XCTAssertEqual(film.editedAt, "2014-12-20T10:54:07.216000Z")
            XCTAssertEqual(film.url, "https://swapi.dev/api/films/4/")
        } catch {
            XCTAssertTrue(false)
        }
    }
    
    func testGeneratingFilmCorrectlyByFalseJSON() throws {
        let film = Film(with: [:])
        XCTAssertEqual(film.title, "")
        XCTAssertEqual(film.openingCrawl, "")
        XCTAssertEqual(film.director, "")
        XCTAssertEqual(film.producers, "")
        XCTAssertEqual(film.releaseDate, "")
        XCTAssertEqual(film.characters, [])
        XCTAssertEqual(film.planets, [])
        XCTAssertEqual(film.species, [])
        XCTAssertEqual(film.vehicles, [])
        XCTAssertEqual(film.starships, [])
        XCTAssertEqual(film.createdAt, "")
        XCTAssertEqual(film.editedAt, "")
        XCTAssertEqual(film.url, "")
    }
    
    func testGeneratingPlanetCorrectlyByJSON() throws {
        let bundlePath = Bundle.main.path(forResource: "planets_1", ofType: "tail")
        XCTAssertNotNil(bundlePath)
        do {
            let jsonData = try NSData(contentsOfFile: bundlePath!) as Data
            let json = try JSONSerialization.jsonObject(with: jsonData) as! [String: Any]
            let planet = Planet(with: json)
            XCTAssertEqual(planet.name, "Tatooine")
            XCTAssertEqual(planet.rotationPeriod, 23)
            XCTAssertEqual(planet.orbitalPeriod, 304)
            XCTAssertEqual(planet.diameter, 10465)
            XCTAssertEqual(planet.climate, "arid")
            XCTAssertEqual(planet.gravity, "1 standard")
            XCTAssertEqual(planet.terrain, "desert")
            XCTAssertEqual(planet.hasSurfaceWater, 1)
            XCTAssertEqual(planet.population, 200000)
            XCTAssertEqual(planet.films, ["1", "3", "4", "5", "6"])
            XCTAssertEqual(planet.residents, ["2"])
            XCTAssertEqual(planet.createdAt, "2014-12-09T13:50:49.641000Z")
            XCTAssertEqual(planet.editedAt, "2014-12-20T20:58:18.411000Z")
            XCTAssertEqual(planet.url, "https://swapi.dev/api/planets/1/")
        } catch {
            XCTAssertTrue(false)
        }
    }
    
    func testGeneratingPlanetCorrectlyByFalseJSON() throws {
        let planet = Planet(with: [:])
        XCTAssertEqual(planet.name, "")
        XCTAssertEqual(planet.rotationPeriod, 0)
        XCTAssertEqual(planet.orbitalPeriod, 0)
        XCTAssertEqual(planet.diameter, 0)
        XCTAssertEqual(planet.climate, "")
        XCTAssertEqual(planet.gravity, "")
        XCTAssertEqual(planet.terrain, "")
        XCTAssertEqual(planet.hasSurfaceWater, 0)
        XCTAssertEqual(planet.population, 0)
        XCTAssertEqual(planet.films, [])
        XCTAssertEqual(planet.residents, [])
        XCTAssertEqual(planet.createdAt, "")
        XCTAssertEqual(planet.editedAt, "")
        XCTAssertEqual(planet.url, "")
    }
    
    func testGeneratingSpeciesCorrectlyByJSON() throws {
        let bundlePath = Bundle.main.path(forResource: "species_1", ofType: "tail")
        XCTAssertNotNil(bundlePath)
        do {
            let jsonData = try NSData(contentsOfFile: bundlePath!) as Data
            let json = try JSONSerialization.jsonObject(with: jsonData) as! [String: Any]
            let species = Species(with: json)
            XCTAssertEqual(species.name, "Human")
            XCTAssertEqual(species.classification, "mammal")
            XCTAssertEqual(species.designation, "sentient")
            XCTAssertEqual(species.averageHeight, 180)
            XCTAssertEqual(species.skinColors, "caucasian, black, asian, hispanic")
            XCTAssertEqual(species.eyeColors, "brown, blue, green, hazel, grey, amber")
            XCTAssertEqual(species.hairColors, "blonde, brown, black, red")
            XCTAssertEqual(species.averageLifespan, 120)
            XCTAssertEqual(species.homeworld, ["1"])
            XCTAssertEqual(species.language, "Galactic Basic")
            XCTAssertEqual(species.films, ["1", "2", "3", "4", "5", "6"])
            XCTAssertEqual(species.people, ["66", "67", "68", "74"])
            XCTAssertEqual(species.createdAt, "2014-12-10T13:52:11.567000Z")
            XCTAssertEqual(species.editedAt, "2014-12-20T21:36:42.136000Z")
            XCTAssertEqual(species.url, "https://swapi.dev/api/species/1/")
        } catch {
            XCTAssertTrue(false)
        }
    }
    
    func testGeneratingSpeciesCorrectlyByFalseJSON() throws {
        let species = Species(with: [:])
        XCTAssertEqual(species.name, "")
        XCTAssertEqual(species.classification, "")
        XCTAssertEqual(species.designation, "")
        XCTAssertEqual(species.averageHeight, 0)
        XCTAssertEqual(species.skinColors, "")
        XCTAssertEqual(species.eyeColors, "")
        XCTAssertEqual(species.hairColors, "")
        XCTAssertEqual(species.averageLifespan, 0)
        XCTAssertEqual(species.homeworld, [])
        XCTAssertEqual(species.language, "")
        XCTAssertEqual(species.films, [])
        XCTAssertEqual(species.people, [])
        XCTAssertEqual(species.createdAt, "")
        XCTAssertEqual(species.editedAt, "")
        XCTAssertEqual(species.url, "")
    }
    
    func testGeneratingStarshipCorrectlyByJSON() throws {
        let bundlePath = Bundle.main.path(forResource: "starships_31", ofType: "tail")
        XCTAssertNotNil(bundlePath)
        do {
            let jsonData = try NSData(contentsOfFile: bundlePath!) as Data
            let json = try JSONSerialization.jsonObject(with: jsonData) as! [String: Any]
            let starship = Starship(with: json)
            XCTAssertEqual(starship.name, "Republic Cruiser")
            XCTAssertEqual(starship.model, "Consular-class cruiser")
            XCTAssertEqual(starship.manufacturer, "Corellian Engineering Corporation")
            XCTAssertEqual(starship.costInCredits, 0)
            XCTAssertEqual(starship.length, 115)
            XCTAssertEqual(starship.maxAtmospheringSpeed, "900")
            XCTAssertEqual(starship.crew, 9)
            XCTAssertEqual(starship.passengers, 16)
            XCTAssertEqual(starship.cargoCapacity, 0)
            XCTAssertEqual(starship.consumables, "unknown")
            XCTAssertEqual(starship.hyperdriveRating, 2.0)
            XCTAssertEqual(starship.MGLT, 0)
            XCTAssertEqual(starship.starshipClass, "Space cruiser")
            XCTAssertEqual(starship.pilots, [])
            XCTAssertEqual(starship.films, ["4"])
            XCTAssertEqual(starship.createdAt, "2014-12-19T17:01:31.488000Z")
            XCTAssertEqual(starship.editedAt, "2014-12-20T21:23:49.912000Z")
            XCTAssertEqual(starship.url, "https://swapi.dev/api/starships/31/")
        } catch {
            XCTAssertTrue(false)
        }
    }
    
    func testGeneratingStarshipCorrectlyByFalseJSON() throws {
        let starship = Starship(with: [:])
        XCTAssertEqual(starship.name, "")
        XCTAssertEqual(starship.model, "")
        XCTAssertEqual(starship.manufacturer, "")
        XCTAssertEqual(starship.costInCredits, 0)
        XCTAssertEqual(starship.length, 0)
        XCTAssertEqual(starship.maxAtmospheringSpeed, "")
        XCTAssertEqual(starship.crew, 0)
        XCTAssertEqual(starship.passengers, 0)
        XCTAssertEqual(starship.cargoCapacity, 0)
        XCTAssertEqual(starship.consumables, "")
        XCTAssertEqual(starship.hyperdriveRating, 0.0)
        XCTAssertEqual(starship.MGLT, 0)
        XCTAssertEqual(starship.starshipClass, "")
        XCTAssertEqual(starship.pilots, [])
        XCTAssertEqual(starship.films, [])
        XCTAssertEqual(starship.createdAt, "")
        XCTAssertEqual(starship.editedAt, "")
        XCTAssertEqual(starship.url, "")
    }
    
    func testGeneratingVehicleCorrectlyByJSON() throws {
        let bundlePath = Bundle.main.path(forResource: "vehicles_33", ofType: "tail")
        XCTAssertNotNil(bundlePath)
        do {
            let jsonData = try NSData(contentsOfFile: bundlePath!) as Data
            let json = try JSONSerialization.jsonObject(with: jsonData) as! [String: Any]
            let vehicle = Vehicle(with: json)
            XCTAssertEqual(vehicle.name, "Vulture Droid")
            XCTAssertEqual(vehicle.model, "Vulture-class droid starfighter")
            XCTAssertEqual(vehicle.manufacturer, "Haor Chall Engineering, Baktoid Armor Workshop")
            XCTAssertEqual(vehicle.costInCredits, 0)
            XCTAssertEqual(vehicle.length, 3.5)
            XCTAssertEqual(vehicle.maxAtmospheringSpeed, 1200)
            XCTAssertEqual(vehicle.crew, 0)
            XCTAssertEqual(vehicle.passengers, 0)
            XCTAssertEqual(vehicle.cargoCapacity, 0)
            XCTAssertEqual(vehicle.consumables, "none")
            XCTAssertEqual(vehicle.vehicleClass, "starfighter")
            XCTAssertEqual(vehicle.pilots, [])
            XCTAssertEqual(vehicle.films, ["4"])
            XCTAssertEqual(vehicle.createdAt, "2014-12-19T17:09:53.584000Z")
            XCTAssertEqual(vehicle.editedAt, "2014-12-20T21:30:21.697000Z")
            XCTAssertEqual(vehicle.url, "https://swapi.dev/api/vehicles/33/")
        } catch {
            XCTAssertTrue(false)
        }
    }
    
    func testGeneratingVehicleCorrectlyByFalseJSON() throws {
        let vehicle = Vehicle(with: [:])
        XCTAssertEqual(vehicle.name, "")
        XCTAssertEqual(vehicle.model, "")
        XCTAssertEqual(vehicle.manufacturer, "")
        XCTAssertEqual(vehicle.costInCredits, 0)
        XCTAssertEqual(vehicle.length, 0)
        XCTAssertEqual(vehicle.maxAtmospheringSpeed, 0)
        XCTAssertEqual(vehicle.crew, 0)
        XCTAssertEqual(vehicle.passengers, 0)
        XCTAssertEqual(vehicle.cargoCapacity, 0)
        XCTAssertEqual(vehicle.consumables, "")
        XCTAssertEqual(vehicle.vehicleClass, "")
        XCTAssertEqual(vehicle.pilots, [])
        XCTAssertEqual(vehicle.films, [])
        XCTAssertEqual(vehicle.createdAt, "")
        XCTAssertEqual(vehicle.editedAt, "")
        XCTAssertEqual(vehicle.url, "")
    }
}
