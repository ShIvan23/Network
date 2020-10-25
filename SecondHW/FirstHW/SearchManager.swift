//
//  SearchManager.swift
//  FirstHW
//
//  Created by Ivan on 25.10.2020.
//

import Foundation

class SearchManager {
    
    private let repoName: String
    private let language: String
    private let urlResponse: String
    private let sort: String?
    
    init(repoName: String, language: String, url: String, sort: String) {
        self.repoName = repoName
        self.language = language
        self.urlResponse = url
        self.sort = sort
    }
    
    func searchRepository() {
        let urlForSearch = urlResponse + repoName + "+language:" + language + sort!
        guard let url = URL(string: urlForSearch) else { return }
        
        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, error) in
            
            guard let response = response, let data = data else { return }
            
            print(response)
            print(data)
            
        }.resume()
    }
}
