//
//  ViewController.swift
//  FirstHW
//
//  Created by Ivan on 18.10.2020.
//

import UIKit
import Kingfisher

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    private let urlImage = URL(string: "https://pngimg.com/uploads/github/github_PNG40.png")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createUI()
    }

    @IBAction func loginButton(_ sender: Any) {
    }
    
    private func createUI() {
        imageView.kf.setImage(with: urlImage)
    }
}
