//
//  ViewController.swift
//  FirstHW
//
//  Created by Ivan on 18.10.2020.
//

import UIKit
import Kingfisher
import LocalAuthentication

class ViewController: UIViewController {
    
    //    MARK: - IBOutlets
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    //    MARK: - Private Properties
    private let url = URL(string: "https://pngimg.com/uploads/github/github_PNG40.png")
    private let authorization: AuthorizationProtocol = AuthorizationManger()
    private let keychain: KeychainProtocol = KeychainManager()
    private let biometrics: BiometricsProtocol = BiometricsAuthentication()
    
    //    MARK: - Life Cycles Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        createUI()
        readKeychain()
    }
    
    //    MARK: - IBActions
    @IBAction func loginButton(_ sender: Any) {
        savePassword()
        singIn()
    }
    
    //    MARK: - Private Methods
    private func createUI() {
        imageView.kf.setImage(with: url)
    }
    
    private func savePassword() {
        guard let userName = userNameTextField.text,
              let password = passwordTextField.text,
              !userName.isEmpty, !password.isEmpty else {
            print("not all text fields entered")
            return
        }
        
        let result = keychain.savePassword(password: password, userName: userName)
        
        if result, let savedPassword = keychain.readPassword(userName: userName) {
            print("Password saved: \(savedPassword)")
        } else {
            print("Can't save password")
        }
    }
    
    private func singIn() {
        guard let userName = userNameTextField.text,
              let password = passwordTextField.text,
              !userName.isEmpty, !password.isEmpty else {
            print("not all text fields entered")
            return
        }
        
        authorization(userName: userName, password: password)
    }
    
    private func authorization(userName: String, password: String) {
        authorization.singIn(userName: userName, password: password, completionHandler: { [weak self] (user) in
            DispatchQueue.main.async {
                let vc = SearchViewController()
                vc.userName = user?.login ?? ""
                vc.imageURL = user?.avatarURL ?? ""
                self?.navigationController?.pushViewController(vc, animated: true)
            }
        })
    }
    
    private func readKeychain() {
        let passwordItems = keychain.readAllItems()
        print(passwordItems ?? [:])
        
        if passwordItems != nil {
            biometrics.biometricsAuthentication(passwordItems: passwordItems!) { [unowned self] (userName, password) in
                self.authorization(userName: userName, password: password)
            }
        }
    }
}
