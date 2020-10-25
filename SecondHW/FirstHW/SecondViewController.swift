//
//  SecondViewController.swift
//  FirstHW
//
//  Created by Ivan on 24.10.2020.
//

import UIKit
import Kingfisher

class SecondViewController: UIViewController {
    
    @IBOutlet weak var userNameLabel: UILabel!
    
    @IBOutlet weak var avatarImageView: UIImageView!
    
    @IBOutlet weak var repoNameTextField: UITextField!
    @IBOutlet weak var languageTextField: UITextField!
    
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    private let urlImage = URL(string: "https://www.sportclub.ru/static/img/user-default-image.png")
    private var response = "https://api.github.com/?q="

    override func viewDidLoad() {
        super.viewDidLoad()
        createUI()
    }
    
    @IBAction func searchButton(_ sender: Any) {
        guard let nameText = repoNameTextField.text else { return }
        guard let languageText = languageTextField.text else { return }
        
        if segmentControl.selectedSegmentIndex == 0 {
            let search = SearchManager(repoName: nameText, language: languageText, url: response, sort: "")
            search.searchRepository()
        } else {
            let search = SearchManager(repoName: nameText, language: languageText, url: response, sort: "1&sort=stars&order=desc")
            search.searchRepository()
        }
    }
    
    private func createUI() {
        avatarImageView.kf.setImage(with: urlImage)
        avatarImageView.layer.cornerRadius = 64
        avatarImageView.contentMode = .scaleAspectFill
    }
}
