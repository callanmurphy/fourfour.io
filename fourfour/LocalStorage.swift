//
//  LocalStorage.swift
//  fourfour
//
//  Created by callan on 2022-02-14.
//

import Foundation

class LocalStorage {
    
    private static var myKey: String = "myKey"
    
    public static var myValue: String {
        set {
            UserDefaults.standard.set(newValue, forKey: myKey)
        }
        get {
            return UserDefaults.standard.string(forKey: myKey) ?? ""
        }
    }
}
