//
//  FilmProvider.swift
//  SwiftNavigation
//
//  Created by Andre Heß on 29.09.23.
//

import UIKit

class FilmProvider: NSObject {
    private var films: [Film]?
    
    private var httpClinet: HttpClient
    
    private var area: String = "films/"
    
    static let sharedObject = FilmProvider()

    
    var numberOfFilms: Int {
        get {
            return films?.count ?? 0
        }
    }
    
    func fetchAllFilms(completion: ((Error?) -> Void)?) {
        if let films, films.count > 0 {
            completion?(nil)
        }
        
        httpClinet.Get(withPath: area, withParameters: nil) { responseObject, error in
            if error != nil {
                completion?(error)
                
                return
            }
            
            if let jsonFilms = (responseObject as? [String: Any])?["results"] as? [[String: Any]] {
                var readFilms: [Film] = []
                
                jsonFilms.forEach { filmDict in
                    readFilms.append(Film(with: filmDict))
                }
                
                self.films = readFilms
                
                completion?(nil)
            }
        }
    }
    
    func film(at index: Int) -> Film? {
        if let myFilms = films, index < numberOfFilms, index >= 0 {
            return myFilms[index]
        }
        
        return nil
    }
    
    override init() {
        self.films = []
        self.httpClinet = HttpClient.sharedObject
        
        super.init()
    }
}
