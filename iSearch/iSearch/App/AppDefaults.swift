//
//  AppDefaults.swift
//  iSearch
//
//  Created by Glenn Von Posadas on 4/10/20.
//  Copyright © 2020 CitusLabs. All rights reserved.
//

import Foundation

/// The class that has multiple class functions for handling defaults.
/// Also has the helper class functions for handling auth tokens.
class LLFDefaults {
    
    // MARK: - Functions
    
    /// Stores object.
    class func store<T: Encodable>(_ object: T, key: LLFDefaultsKey) {
        let encoder = JSONEncoder()
        let encoded = try? encoder.encode(object)
        
        if encoded == nil {
            UserDefaults.standard.set(object, forKey: key.rawValue)
            return
        }
        
        UserDefaults.standard.set(encoded, forKey: key.rawValue)
    }
    
    /// Removes the object token
    class func removeDefaultsWithKey(_ key: LLFDefaultsKey) {
        UserDefaults.standard.removeObject(forKey: key.rawValue)
    }
    
    /// Returns stored object (optional) if any.
    class func getObjectWithKey<T: Decodable>(_ key: LLFDefaultsKey, type: T.Type) -> T? {
        if let savedData = UserDefaults.standard.data(forKey: key.rawValue) {
            let object = try? JSONDecoder().decode(type, from: savedData)
            return object
        }
        
        return UserDefaults.standard.object(forKey: key.rawValue) as? T
    }
}
