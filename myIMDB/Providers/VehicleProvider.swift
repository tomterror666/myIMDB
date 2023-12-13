//
//  VehicleProvider.swift
//  SwiftNavigation
//
//  Created by Andre Heß on 16.10.23.
//

import UIKit

/// Class for retrieving and storing vehicles from **SWAPI**
class VehicleProvider: NSObject {
    /// Used client for doing the restful API calls
    private var httpClinet: HttpClient
    
    /// Path to the Characters API endpoint
    private var path: String = "vehicles/"
    
    /// Singelton for common usage
    static let sharedObject = VehicleProvider()
    
    /// Currently stored list of characters as dictionary of ``String`` id to ``Vehicle`` objects
    private var vehicles: [String: Vehicle]
    
    /// Overriden func **init**
    override init() {
        self.httpClinet = HttpClient.sharedObject
        self.vehicles = [:]
        
        super.init()
    }
    
    /// Fetching a vehicle which is stored if possible or if already fetched it is taken from storage
    ///
    /// - parameters id:                    ID of the vehicle to fetch
    /// - parameters completion:    Completion which is called on end with data as ``Vehicle`` or error
    func fetchVehicle(withId id: String, completion: ((Vehicle?, Error?) -> Void)?) {
        if let vehicle = vehicles[id] {
            completion?(vehicle, nil)
            
            return
        }
        
        httpClinet.Get(withPath: path+id, withParameters: nil) { responseObject, error in
            if error != nil {
                completion?(nil, error)
                
                return
            }
            
            let vehicle = Vehicle(with: responseObject as! [String: Any])
            
            if self.vehicles[id] == nil {
                self.vehicles[id] = vehicle
            }
            
            completion?(vehicle, nil)
        }
    }
}
