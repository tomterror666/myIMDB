//
//  FilmProvider.swift
//  SwiftNavigation
//
//  Created by Andre Heß on 29.09.23.
//

import UIKit

/// Class for retrieving and storing films from **SWAPI**
class FilmProvider: NSObject {
    /// Used client for doing the restful API calls
    private var httpClinet: HttpClient
    
    /// Path to the Characters API endpoint
    private var path: String = "films/"
    
    /// Singelton for common usage
    static let sharedObject = FilmProvider()

    /// Currently stored list of characters as array of ``Film`` objects
    private var films: [Film]?
    
    /// Overriden func **init**
    override init() {
        self.films = []
        self.httpClinet = HttpClient.sharedObject
        
        super.init()
    }
    
    /// Number of currently fetched films
    var numberOfFilms: Int {
        get {
            return films?.count ?? 0
        }
    }
    
    /// Fetch all available films from **SWAPI** and store them or if already fetched they are taken from storage
    ///
    /// - parameters completion:    Completion which is called on end with data as array of ``Film`` or error
    func fetchAllFilms(completion: ((Error?) -> Void)?) {
        if let films = films, films.count > 0 {
            completion?(nil)
        }
        
        httpClinet.Get(withPath: path, withParameters: nil) { responseObject, error in
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
    
    /// Get a film by index if possible
    ///
    /// - parameter index:  Index of the film to obtain
    ///
    /// - Returns: Film at given index as ``Film`` or nil if not available
    func film(at index: Int) -> Film? {
        if let myFilms = films, index < numberOfFilms, index >= 0 {
            return myFilms[index]
        }
        
        return nil
    }
    
}
