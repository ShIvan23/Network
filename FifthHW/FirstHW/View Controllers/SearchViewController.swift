//
//  SearchViewController.swift
//  FirstHW
//
//  Created by Ivan on 21.11.2020.
//

import UIKit
import Kingfisher

class SearchViewController: UIViewController {
    
    //    MARK: - Public Properties
    var userName: String? {
        didSet {
            userNameLabel.text = "Hello, \(userName ?? "")"
        }
    }
    
    var imageURL: String? {
        didSet {
            guard let url = URL(string: imageURL!) else { return }
            avatarImageView.kf.setImage(with: url)
        }
    }
    
    //    MARK: - Private Properties
    private let sort = "1&sort=stars&order=desc"
    private var response = "https://api.github.com/search/repositories?q="
    
    private let userNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 30)
        label.textAlignment = .center
        return label
    }()
    
    private let avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 64
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let repoNameTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "repository name"
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    private let languageTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "language"
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    private let segmentControl: UISegmentedControl = {
        let segment = UISegmentedControl()
        segment.translatesAutoresizingMaskIntoConstraints = false
        segment.insertSegment(withTitle: "Without sort", at: 0, animated: true)
        segment.insertSegment(withTitle: "With sort", at: 1, animated: true)
        segment.selectedSegmentIndex = 0
        return segment
    }()
    
    private let searchButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Search repository", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        return button
    }()
    
    //    MARK: - Life Cicles Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        createUI()
    }
    
    //    MARK: - Privates Methods
    private func createUI() {
        view.backgroundColor = .white
        
        searchButton.addTarget(self, action: #selector(tapSearchButtom), for: .touchUpInside)
        
        let elements = [userNameLabel, avatarImageView, repoNameTextField, languageTextField, segmentControl, searchButton]
        elements.forEach { (element) in
            view.addSubview(element)
        }
        
        let constraints = [
            userNameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            userNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            userNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            userNameLabel.heightAnchor.constraint(equalToConstant: 50),
            
            avatarImageView.topAnchor.constraint(equalTo: userNameLabel.bottomAnchor, constant: 30),
            avatarImageView.widthAnchor.constraint(equalToConstant: 128),
            avatarImageView.heightAnchor.constraint(equalToConstant: 128),
            avatarImageView.centerXAnchor.constraint(equalTo: userNameLabel.centerXAnchor),
            
            repoNameTextField.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 30),
            repoNameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            repoNameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            repoNameTextField.heightAnchor.constraint(equalToConstant: 40),
            
            languageTextField.topAnchor.constraint(equalTo: repoNameTextField.bottomAnchor, constant: 15),
            languageTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            languageTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            languageTextField.heightAnchor.constraint(equalToConstant: 40),
            
            segmentControl.topAnchor.constraint(equalTo: languageTextField.bottomAnchor, constant: 35),
            segmentControl.leadingAnchor.constraint(equalTo: languageTextField.leadingAnchor),
            segmentControl.trailingAnchor.constraint(equalTo: languageTextField.trailingAnchor),
            segmentControl.heightAnchor.constraint(equalToConstant: 40),
            
            searchButton.topAnchor.constraint(equalTo: segmentControl.bottomAnchor, constant: 45),
            searchButton.leadingAnchor.constraint(equalTo: segmentControl.leadingAnchor),
            searchButton.trailingAnchor.constraint(equalTo: segmentControl.trailingAnchor),
            searchButton.heightAnchor.constraint(equalToConstant: 50)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    @objc private func tapSearchButtom() {
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
}
