//
//  NewPostCell.swift
//  Course2FinalTask
//
//  Created by Ivan on 07.10.2020.
//  Copyright © 2020 e-Legion. All rights reserved.
//

import UIKit

let identifierNewPost = "NewPostCell"

class NewPostCell: UICollectionViewCell {
    
    //    MARK:- Properties
    private let photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //    MARK:- Methods
    func createCell(image: UIImage) {
        photoImageView.image = image
    }
    
    private func configureUI() {
        addSubview(photoImageView)
        
        let constraints = [photoImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
                           photoImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
                           photoImageView.topAnchor.constraint(equalTo: self.topAnchor),
                           photoImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor)]
        
        NSLayoutConstraint.activate(constraints)
    }
}
