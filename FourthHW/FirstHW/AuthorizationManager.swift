//
//  AuthorizationManager.swift
//  FirstHW
//
//  Created by Ivan on 15.11.2020.
//

import Foundation

protocol AuthorizationProtocol {
    func createURL(_ userName: String, _ password: String) -> URLRequest?
    func dataTask(_ userName: String, _ password: String, completionHandler: @escaping (_ data: Data?, _ error: Error?) -> Void)
    func parseJSON(userName: String, password: String, completionHandler: @escaping (_ model: LoginUser?) -> Void)
}

class AuthorizationManger: AuthorizationProtocol {
    
    private let url = "https://api.github.com/user"
    private let keyForHeader = "Authorization"
    
    func createURL(_ userName: String, _ password: String) -> URLRequest? {
        let userNameAndPassword = userName + ":" + password
        guard let string64 = userNameAndPassword.data(using: .utf8)?.base64EncodedString() else { return nil }
        let header = [keyForHeader: "Basic \(string64)"]
        guard let url = URL(string: url) else { return nil }
        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = header
        return request
    }
    
    func dataTask(_ userName: String, _ password: String, completionHandler: @escaping (Data?, Error?) -> Void) {
        guard let request = createURL(userName, password) else { return }
        
        let dataTask = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
                completionHandler(nil, error)
                return
            }
            
            if let response = response as? HTTPURLResponse {
                print(response.statusCode)
            }
            
            if let data = data {
                completionHandler(data, nil)
            }
        }
        dataTask.resume()
    }
    
    func parseJSON(userName: String, password: String, completionHandler: @escaping (LoginUser?) -> Void) {
        dataTask(userName, password) { (data, error) in
            if error != nil {
                completionHandler(nil)
            }
            
            if let data = data {
                do {
                    let json = try JSONDecoder().decode(LoginUser.self, from: data)
                    completionHandler(json)
                } catch {
                    print("Error with parsing JSON")
                }
            }
        }
    }
}
