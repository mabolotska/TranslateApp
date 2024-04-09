//
//  UDManager.swift
//  TranslateApp
//
//  Created by Maryna Bolotska on 09/04/24.
//

import Foundation

protocol UserDefaultsManagerProtocol {

    ///methods for setting new data
    func set(_ object: Any?, forKey key: Keys)

    ///methods for getting saved data
    func getBool(forKey key: Keys) -> Bool?

    ///delete data
    func delete(forKey key: Keys)
}

public enum Keys: String {

    case favoriteLanguage = "favoriteLanguage"
    case destinationLanguage = "destinationLanguage"
}



final class UserDefaultsManager {

    private let userDefaults = UserDefaults.standard
    

    private func storeData(_ object: Any?, key: String) {
        userDefaults.set(object, forKey: key)
    }

    private func restoreData(forKey key: String) -> Any? {
        userDefaults.object(forKey: key)
    }
}

    // MARK: UserDefaultsManagerProtocol

extension UserDefaultsManager: UserDefaultsManagerProtocol {

    func set(_ object: Any?, forKey key: Keys) {
        storeData(object, key: key.rawValue)
    }

    func getBool(forKey key: Keys) -> Bool? {
        restoreData(forKey: key.rawValue) as? Bool
    }
    
    func restoreLanguage(forKey key: Keys) -> String? {
        restoreData(forKey: key.rawValue) as? String
    }

    func delete(forKey key: Keys) {
        userDefaults.removeObject(forKey: key.rawValue)
    }
    
    func getStringArray(forKey key: Keys) -> [String]? {
         return userDefaults.stringArray(forKey: key.rawValue)
     }
}

