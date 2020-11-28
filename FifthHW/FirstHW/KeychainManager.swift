//
//  KeychainManager.swift
//  FirstHW
//
//  Created by Ivan on 23.11.2020.
//

import Foundation

protocol KeychainProtocol {
    func savePassword(password: String, userName: String) -> Bool
    func readPassword(userName: String) -> String?
    func readAllItems() -> [String : String]?
}

class KeychainManager: KeychainProtocol {
    
    private func keychainQuery(userName: String? = nil) -> [String : AnyObject] {
        let service = "GitHub"
        var query = [String : AnyObject]()
        query[kSecClass as String] = kSecClassGenericPassword
        query[kSecAttrAccessible as String] = kSecAttrAccessibleWhenUnlocked
        query[kSecAttrService as String] = service as AnyObject
       
        if let userName = userName {
            query[kSecAttrAccount as String] = userName as AnyObject
        }
        
        return query
    }
    
    func readPassword(userName: String) -> String? {
        var query = keychainQuery(userName: userName)
        query[kSecMatchLimit as String] = kSecMatchLimitOne
        query[kSecReturnData as String] = kCFBooleanTrue
        query[kSecReturnAttributes as String] = kCFBooleanTrue
        
        var queryResult: AnyObject?
        let status = SecItemCopyMatching(query as CFDictionary, UnsafeMutablePointer(&queryResult))
        
        if status != noErr {
            return nil
        }
        
        guard let item = queryResult as? [String : AnyObject],
              let passwordData = item[kSecValueData as String] as? Data,
              let password = String(data: passwordData, encoding: .utf8) else {
            return nil
        }
        return password
    }
    
    func savePassword(password: String, userName: String) -> Bool {
        let passwordData = password.data(using: .utf8)
        
        if readPassword(userName: userName) != nil {
            var attributesToUpdate = [String : AnyObject]()
            attributesToUpdate[kSecValueData as String] = passwordData as AnyObject
            
            let query = keychainQuery(userName: userName)
            let status = SecItemUpdate(query as CFDictionary, attributesToUpdate as CFDictionary)
            return status == noErr
        }
        
        var item = keychainQuery(userName: userName)
        item[kSecValueData as String] = passwordData as AnyObject
        let status = SecItemAdd(item as CFDictionary, nil)
        return status == noErr
    }
    
    func readAllItems() -> [String : String]? {
        var query = keychainQuery()
        query[kSecMatchLimit as String] = kSecMatchLimitAll
        query[kSecReturnData as String] = kCFBooleanTrue
        query[kSecReturnAttributes as String] = kCFBooleanTrue
        
        var queryResult: AnyObject?
        let status = SecItemCopyMatching(query as CFDictionary, UnsafeMutablePointer(&queryResult))
        
        if status != noErr {
            return nil
        }
        
        guard let items = queryResult as? [[String : AnyObject]] else {
            return nil
        }
        var passwordItems = [String : String]()
        
        for (index, item) in items.enumerated() {
            guard let passwordData = item[kSecValueData as String] as? Data,
                  let password = String(data: passwordData, encoding: .utf8) else {
                continue
            }
            
            if let account = item[kSecAttrAccount as String] as? String {
                passwordItems[account] = password
                continue
            }
            
            let account = "empty account \(index)"
            passwordItems[account] = password
        }
        return passwordItems
    }
}
