//
//  APIManager.swift
//  Course2FinalTask
//
//  Created by Ivan on 03.12.2020.
//  Copyright © 2020 e-Legion. All rights reserved.
//

import Foundation

typealias JSONTask = URLSessionDataTask
typealias JSONCompletionHandler = ([String: AnyObject]?, HTTPURLResponse?, Error?) -> Void

enum APIResult<T> {
    case Success(T)
    case Failure(Error)
}

protocol APIManager {
    var sessionConfiguration: URLSessionConfiguration { get }
    var session: URLSession { get }
    
    func JSONTask(request: URLRequest, compleationHandler: JSONCompletionHandler) -> JSONTask
    func fetch<T>(request: URLRequest, parse: ([String: AnyObject]?) -> T?, completionHandler: (APIResult<T>) -> Void)
    
    init(sessionConfiguration: URLSessionConfiguration)
}
