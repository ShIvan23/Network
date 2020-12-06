//
//  SecondViewController.swift
//  FirstHW
//
//  Created by Ivan on 28.10.2020.
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
    private let sort = "1&sort=stars&order=desc"
    private var response = "https://api.github.com/search/repositories?q="
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createUI()
    }
    
    @IBAction func searchButton(_ sender: Any) {
        guard let nameText = repoNameTextField.text else { return }
        guard let languageText = languageTextField.text else { return }
        
        if segmentControl.selectedSegmentIndex == 0 {
            NetworkManager.searchRepositoryWithoutSort(urlResponse: response, repoName: nameText, language: languageText) { [weak self] (json) in
                
                DispatchQueue.main.async {
                    let tableVC = SearchTableViewController(json: json)
                    self?.navigationController?.pushViewController(tableVC, animated: true)
                }
            }
        } else {
            NetworkManager.searchRepositoryWithSort(urlResponse: response, repoName: nameText, language: languageText, sort: sort) { [weak self] (json) in
                
                DispatchQueue.main.async {
                    let tableVC = SearchTableViewController(json: json)
                    self?.navigationController?.pushViewController(tableVC, animated: true)
                }
            }
        }
    }
    
    private func createUI() {
        avatarImageView.kf.setImage(with: urlImage)
        avatarImageView.layer.cornerRadius = 64
        avatarImageView.contentMode = .scaleAspectFill
    }
}
