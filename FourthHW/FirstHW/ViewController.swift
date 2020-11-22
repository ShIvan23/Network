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
    private let authorization: AuthorizationProtocol = AuthorizationManger()
    
    //    MARK: - Life Cycles Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        createUI()
    }
    
    //    MARK: - IBActions
    @IBAction func loginButton(_ sender: Any) {
        createRequest()
    }
    
    //    MARK: - Private Methods
    private func createUI() {
        imageView.kf.setImage(with: url)
    }
    
    private func createRequest() {
        guard let userName = userNameTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        authorization.parseJSON(userName: userName, password: password, completionHandler: { [weak self] (user) in
            DispatchQueue.main.async {
                let vc = SearchViewController()
                vc.userName = user?.login ?? ""
                vc.imageURL = user?.avatarURL ?? ""
                self?.navigationController?.pushViewController(vc, animated: true)
            }
        })
    }
}
