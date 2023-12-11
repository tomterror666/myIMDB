//
//  BaseModel.swift
//  SwiftNavigation
//
//  Created by Andre Heß on 29.09.23.
//

import UIKit

/// Base model class
class BaseModel: NSObject {
    /// Each model is identifiable by its id - given by json data
    var id: String
    
    private var _jsonDict: [String: Any]
    
    /// dictionary containing source json data
    var jsonDict: [String: Any] {
        get {
            return self._jsonDict
        }
    }
    
    /// Constructor
    ///  - parameter json: source json data as json string
    init(with json: String) {
        self.id = ""
        self._jsonDict = [:]
        
        do {
            if let data = json.data(using: .utf8),
               let jsonDict = try JSONSerialization.jsonObject(with: data) as? [String: Any] {
                
                self.id = jsonDict["id"] as? String ?? ""
                self._jsonDict = jsonDict
            }
        } catch {
            print(error.localizedDescription)
        }
        
        super.init()
    }

    /// Constructor
    ///  - parameter json: source json data as json dictionary object
    init(with dict: [String: Any]) {
        self.id = dict["id"] as? String ?? ""
        self._jsonDict = dict
        
        super.init()
    }
}
