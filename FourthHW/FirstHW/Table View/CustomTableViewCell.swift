//
//  CustomTableViewCell.swift
//  FirstHW
//
//  Created by Ivan on 03.11.2020.
//

import UIKit
import Kingfisher

// MARK: - Puplic Properties
let identifier = "CustomCell"

class CustomTableViewCell: UITableViewCell {
    
    //    MARK: - Private Properties
    private let sizeImage: CGFloat = 50
    
    private let labelName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18)
        return label
    }()
    
    private let loginLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14)
        label.textAlignment = .center
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 15)
        label.numberOfLines = 3
        return label
    }()
    
    private lazy var avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = sizeImage / 2
        imageView.clipsToBounds = true
        return imageView
    }()
    
    //    MARK: - Initilizers
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //    MARK: - Puplic Methods
    func configureCell(_ item: Items) {
        labelName.text = item.name
        loginLabel.text = item.owner.login
        descriptionLabel.text = item.description
        
        let url = URL(string: item.owner.imageURL)
        avatarImageView.kf.setImage(with: url)
    }
    
    //    MARK: - Private Methods
    private func configureUI() {
        let UIElemnts = [labelName, avatarImageView, loginLabel, descriptionLabel]
        UIElemnts.forEach { (element) in
            addSubview(element)
        }
        
        let constraints = [labelName.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
                           labelName.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
                           labelName.trailingAnchor.constraint(equalTo: loginLabel.leadingAnchor, constant: -16),
                           
                           loginLabel.centerXAnchor.constraint(equalTo: avatarImageView.centerXAnchor),
                           loginLabel.bottomAnchor.constraint(equalTo: avatarImageView.topAnchor, constant: -8),
                           loginLabel.widthAnchor.constraint(equalToConstant: sizeImage),
                           
                           descriptionLabel.topAnchor.constraint(equalTo: labelName.bottomAnchor, constant: 8),
                           descriptionLabel.leadingAnchor.constraint(equalTo: labelName.leadingAnchor),
                           descriptionLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5),
                           descriptionLabel.trailingAnchor.constraint(equalTo: avatarImageView.leadingAnchor, constant: -16),
                           
                           avatarImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
                           avatarImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5),
                           avatarImageView.heightAnchor.constraint(equalToConstant: sizeImage),
                           avatarImageView.widthAnchor.constraint(equalToConstant: sizeImage)]
        
        NSLayoutConstraint.activate(constraints)
    }
}
