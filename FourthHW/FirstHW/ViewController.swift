//
//  ViewController.swift
//  FirstHW
//
//  Created by Ivan on 18.10.2020.
//

import UIKit
import Kingfisher

class ViewController: UIViewController {
    
    //    MARK: - IBOutlets
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    //    MARK: - Private Properties
    private let url = URL(string: "https://pngimg.com/uploads/github/github_PNG40.png")
    private let authorization: AuthorizationProtocol?
    
    //    MARK: - Initializers
    init(authorization: AuthorizationProtocol = AuthorizationManger()) {
        self.authorization = authorization
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //    MARK: - Life Cycles Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        createUI()
    }
    
    //    MARK: - Private Methods
    private func createUI() {
        imageView.kf.setImage(with: url)
    }
    
    //    MARK: - IBActions
    @IBAction func loginButton(_ sender: Any) {
//        apiRequest()
        createRequest()
    }
    
    private func apiRequest() {
        let https = "https://api.github.com/user"
        let key = "Authorization"
        let value = "ShIvan23:1edf9ede9a5a11f184d112fb3b8ae070a8b803dd"
        guard let value64 = value.data(using: .utf8)?.base64EncodedString() else { return }
        //        let value64 = valueUTF.base64EncodedString()
        let header = [key: "Basic \(value64)"]
        guard let url = URL(string: https) else { return }
        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = header
        //        request.setValue("Basic \(value64)", forHTTPHeaderField: key)
        
        let dataTask = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            if let error = error {
                print(error.localizedDescription)
            }
            
            if let response = response as? HTTPURLResponse {
                print(response.statusCode)
            }
            
            if let data = data {
                print(data)
            }
        }
        dataTask.resume()
    }
    
    private func createRequest() {
        guard let userName = userNameTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        authorization?.parseJSON(userName: userName, password: password, completionHandler: { (user) in
//            Передать в Second VC имя и картинку. Переопределить метод prepare
        })
    }
    
   
}
