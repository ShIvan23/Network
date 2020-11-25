//
//  NetworkManager.swift
//  FirstHW
//
//  Created by Ivan on 28.10.2020.
//

import Foundation

class NetworkManager {
    
//    MARK: - Static Methods
    static func searchRepositoryWithoutSort(urlResponse: String, repoName: String, language: String, completion: @escaping (_ model: RepositoryModel) -> ()) {
        let urlForSearch = urlResponse + repoName + "+language:" + language
        print(urlForSearch)
        guard let url = URL(string: urlForSearch) else { return }
        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, error) in
            
            guard error == nil else {
                print(error!.localizedDescription)
                return
            }
            
            guard let data = data else {
                print(error!.localizedDescription)
                return }
            
            do {
                let json = try JSONDecoder().decode(RepositoryModel.self, from: data)
                completion(json)

            } catch {
                print(error.localizedDescription)
            }
            
        }.resume()
    }
    
    static func searchRepositoryWithSort(urlResponse: String, repoName: String, language: String, sort: String, completion: @escaping (_ model: RepositoryModel) -> ()) {
        let urlForSearch = urlResponse + repoName + "+language:" + language + sort
        guard let url = URL(string: urlForSearch) else { return }
        
        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, error) in
            
            guard error == nil else {
                print(error!.localizedDescription)
                return
            }
            
            guard let data = data else {
                print(error!.localizedDescription)
                return }
            
            do {
                let json = try JSONDecoder().decode(RepositoryModel.self, from: data)
                completion(json)

            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
}
