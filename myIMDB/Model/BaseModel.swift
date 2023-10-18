//
//  BaseModel.swift
//  SwiftNavigation
//
//  Created by Andre Heß on 29.09.23.
//

import UIKit

class BaseModel: NSObject {
    var id: String
    
    private var _jsonDict: [String: Any]
    var jsonDict: [String: Any] {
        get {
            return self._jsonDict
        }
    }
    
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
    
    init(with dict: [String: Any]) {
        self.id = dict["id"] as? String ?? ""
        self._jsonDict = dict
        
        super.init()
    }
}
