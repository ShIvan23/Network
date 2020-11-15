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
    }
}
