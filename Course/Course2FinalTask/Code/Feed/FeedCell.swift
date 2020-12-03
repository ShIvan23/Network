//
//  FeedCell.swift
//  Course2FinalTask
//
//  Created by Ivan on 26.07.2020.
//  Copyright © 2020 e-Legion. All rights reserved.
//

import UIKit

//protocol LikeImageButtonDelegate: AnyObject {
//    func tapLike(post: Post)
//    func tapBigLike(post: Post)
//    func tapAvatarAndUserName(post: Post)
//    func tapLikesButton(post: Post)
//}

class FeedCell: UICollectionViewCell {
    
    //    MARK:- Properties
//    weak var delegate: LikeImageButtonDelegate?
    let dateFormatter = DateFormatter()
//    var post: Post? {
//        didSet {
//            likesButton.setTitle("Likes: \(post?.likedByCount ?? 0)", for: .normal)
//            liked = post?.currentUserLikesThisPost ?? false
//        }
//    }
    
    private var liked: Bool = false {
        didSet {
            likesImageButton.tintColor = liked == true ? self.tintColor : .lightGray
        }
    }
    
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var postImage: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var postDateLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var likesButton: UIButton!
    @IBOutlet weak var likesImageButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        addGesture()
    }
    
    //    MARK:- Methods
    func setupCell() {
//        avatarImage.image = post?.authorAvatar
//        postImage.image = post?.image
        
//        userNameLabel.text = post?.authorUsername
        dateFormatter.dateFormat = "MMM d, yyyy 'at:' HH:mm:ss"
//        postDateLabel.text = dateFormatter.string(from: post?.createdTime ?? Date())
        
        likesButton.setTitleColor(.black, for: .normal)
        likesButton.addTarget(self, action: #selector(tapLikesButton), for: .touchUpInside)
        
//        descriptionLabel.text = post?.description
        
        likesImageButton.setImage(#imageLiteral(resourceName: "like"), for: .normal)
        likesImageButton.addTarget(self, action: #selector(tap), for: .touchUpInside)
    }
    
    func addGesture() {
        let postImageGesture = UITapGestureRecognizer(target: self, action: #selector(bigLike(sender:)))
        postImageGesture.numberOfTapsRequired = 2
        postImage.isUserInteractionEnabled = true
        postImage.addGestureRecognizer(postImageGesture)
        
        let avatarAndGesture = UITapGestureRecognizer(target: self, action: #selector(tapAvatarAndUserName))
        avatarImage.isUserInteractionEnabled = true
        avatarImage.addGestureRecognizer(avatarAndGesture)
        
        let userNameGesture = UITapGestureRecognizer(target: self, action: #selector(tapAvatarAndUserName))
        userNameLabel.isUserInteractionEnabled = true
        userNameLabel.addGestureRecognizer(userNameGesture)
    }
    
    @objc private func tap() {
//        guard let post = post else { return }
//        delegate?.tapLike(post: post)
    }
    
    
    @objc func tapAvatarAndUserName() {
//        guard let post = post else { return }
//        delegate?.tapAvatarAndUserName(post: post)
    }
    
    private func showBihLike(completion: @escaping () -> Void) {
        let likeImage = UIImage(named: "bigLike")
        let likeView = UIImageView(image: likeImage)
        likeView.center = postImage.center
        likeView.layer.opacity = 0
        addSubview(likeView)
        
        UIView.animate(withDuration: 0.25, animations: {
            likeView.alpha = 1
        }) { _ in
            UIView.animate(withDuration: 0.25, delay: 0.15, options: .curveEaseOut, animations: {
                likeView.alpha = 0
            }) { _ in
                completion()
            }
        }
    }
    
    @objc func bigLike(sender: UITapGestureRecognizer) {
//        guard let post = post else { return }
//        guard post.currentUserLikesThisPost == false else { return }
//        showBihLike() { [unowned self] in
//            self.delegate?.tapBigLike(post: post)
//        }
    }
    
    @objc private func tapLikesButton() {
//        guard let post = post else { return }
//        delegate?.tapLikesButton(post: post)
    }
}
