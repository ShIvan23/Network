//
//  NetworkManager.swift
//  FirstHW
//
//  Created by Ivan on 28.10.2020.
//

import Foundation

class NetworkManager {
    
    static func searchRepositoryWithoutSort(urlResponse: String, repoName: String, language: String, completion: @escaping (_ response: URLResponse, _ data: Data) -> ()) {
        let urlForSearch = urlResponse + repoName + "+language:" + language
        guard let url = URL(string: urlForSearch) else { return }
        
        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, error) in
            
            guard let response = response, let data = data else { return }
            completion(response, data)
        }.resume()
    }
    
    static func searchRepositoryWithSort(urlResponse: String, repoName: String, language: String, sort: String, completion: @escaping (_ response: URLResponse, _ data: Data) -> ()) {
        let urlForSearch = urlResponse + repoName + "+language:" + language + sort
        guard let url = URL(string: urlForSearch) else { return }
        
        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, error) in
            
            guard let response = response, let data = data else { return }
            completion(response, data)
        }.resume()
    }
    
}
