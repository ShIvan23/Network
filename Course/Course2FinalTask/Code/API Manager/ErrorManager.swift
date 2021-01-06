//
//  ErrorManager.swift
//  Course2FinalTask
//
//  Created by Ivan on 05.12.2020.
//  Copyright © 2020 e-Legion. All rights reserved.
//

import Foundation

enum ErrorManager: String, Error {
    case badRequest = "Bad request" // 400
    case unauthorized = "Unauthorized" // 401
    case notFound = "Not found" // 404
    case notAcceptable = "Not acceptable" // 406
    case unprocessable = "Unprocessable" // 422
    case transferError = "Transfer error"
}
