//
//  RepositoriesModel.swift
//  FirstHW
//
//  Created by Ivan on 01.11.2020.
//

import Foundation

struct RepositoryModel: Codable {
    var totalCount: Int
    var items: [Items]
    
    private enum CodingKeys: String, CodingKey {
        case totalCount = "total_count"
        case items
    }
}

struct Items: Codable {
    var name: String
    var description: String?
    var owner: Owner
}

struct Owner: Codable {
    var login: String
    var imageURL: String

    private enum CodingKeys: String, CodingKey {
        case imageURL = "avatar_url"
        case login
    }
}


