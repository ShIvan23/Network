//
//  AuthorizationModel.swift
//  FirstHW
//
//  Created by Ivan on 18.11.2020.
//

import Foundation

struct LoginUser: Codable {
    var login: String
    var avatarURL: String
    
    private enum CodingKeys: String, CodingKey {
        case login
        case avatarURL = "avatar_url"
    }
}
