//
//  VehicleProvider.swift
//  SwiftNavigation
//
//  Created by Andre Heß on 16.10.23.
//

import UIKit

class VehicleProvider: NSObject {
    private var httpClinet: HttpClient
    
    private var area: String = "vehicles/"
    
    static let sharedObject = VehicleProvider()
    
    private var vehicles: [String: Vehicle]
    
    override init() {
        self.httpClinet = HttpClient.sharedObject
        self.vehicles = [:]
        
        super.init()
    }
    
    func fetchVehicle(withId id: String, completion: ((Vehicle?, Error?) -> Void)?) {
        if let vehicle = vehicles[id] {
            completion?(vehicle, nil)
            
            return
        }
        
        httpClinet.Get(withPath: area+id, withParameters: nil) { responseObject, error in
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
