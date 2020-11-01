//
//  RepositoriesModel.swift
//  FirstHW
//
//  Created by Ivan on 01.11.2020.
//

import Foundation

struct Repository: Decodable {
    
    let name: String
    let login: String
    let avatarURL: String
    let description: String
    
    init? (json: [String: Any]) {
        guard let items = json["items"] as? Dictionary<String, Any>,
              let name = items["name"] as? String,
              let owner = items["owner"] as? Dictionary<String, Any>,
              let login = owner["login"] as? String,
              let avatarURL = owner["avatar_url"] as? String,
              let description = items["description"] as? String else { return nil }
       
        self.name = name
        self.login = login
        self.avatarURL = avatarURL
        self.description = description
    }
}
