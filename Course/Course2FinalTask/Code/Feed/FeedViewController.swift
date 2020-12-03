//
//  FeedViewController.swift
//  Course2FinalTask
//
//  Created by Ivan on 21.07.2020.
//  Copyright © 2020 e-Legion. All rights reserved.
//

import UIKit

//class FeedViewController: UIViewController, UICollectionViewDataSource {
    class FeedViewController: UIViewController {
    
    //    MARK:- Properties
    @IBOutlet weak var collectionView: UICollectionView!
    
//    private let userClass = UserClass()
//    private let postClass = PostClass()
    private lazy var block = BlockViewController(view: (tabBarController?.view)!)
    private lazy var alert = AlertViewController(view: self)
//    private var postsArray: [Post]?
//    private var currentUser: User?
//    private var usersLikedPost: [User]?
//    private var user: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createCurrentUser()
        createPostsArrayWithBlock()
        title = "Feed"
        collectionView.register(UINib(nibName: "FeedCell", bundle: nil), forCellWithReuseIdentifier: "FeedCell")
//        collectionView.dataSource = self
//        collectionView.delegate = FeedCell() as? UICollectionViewDelegate
    }
    
    //    MARK:- Methods
    
    //    Обновляет UI и скроллит в начало ленты при публикации новой фотографии
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        createPostsArrayWithBlock()
        collectionView.scrollToItem(at: IndexPath(item: 0, section: 1), at: .top, animated: true)
    }
    
    //    Создает текущего пользователя
    private func createCurrentUser() {
//        userClass.currentUser(queue: DispatchQueue.global()) { (user) in
//            guard user != nil else { self.alert.createAlert {_ in}
//                return }
//            DispatchQueue.main.async {
//                self.currentUser = user
//            }
//        }
    }
    
    //    Создает массив постов без блокировки UI для лайков
    func createPostsArrayWithoutBlock() {
//        postClass.feed(queue: DispatchQueue.global()) { (postsArray) in
//            guard postsArray != nil else { self.alert.createAlert { _ in
//                self.postsArray = [] }
//                return }
//            DispatchQueue.main.async {
//                self.postsArray = postsArray
//                self.collectionView.reloadData()
//            }
//        }
    }
    
    //    Создает массив постов с блокировкой UI
    private func createPostsArrayWithBlock() {
        block.startAnimating()
//        postClass.feed(queue: DispatchQueue.global()) { (postsArray) in
//            guard postsArray != nil else { self.alert.createAlert { _ in
//                self.postsArray = [] }
//                return }
//            DispatchQueue.main.async {
//                self.postsArray = postsArray
//                self.block.stopAnimating()
//                self.collectionView.reloadData()
//            }
//        }
    }
    
    //    Cоздание VC и переход в профиль пользователя
//    private func goToUserProfile(user: User) {
//        let storyboard = UIStoryboard(name: "Storyboard", bundle: nil)
//        guard let profileVC = storyboard.instantiateViewController(withIdentifier: "ProfileViewController") as? ProfileViewController else { alert.createAlert {_ in}
//            return }
//        profileVC.user = user
//        show(profileVC, sender: nil)
//    }
//}

//    MARK:- DataSource and Delegate
//extension FeedViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        guard let array = postsArray else { return 0 }
//        return array.count
//        1
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//
//        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FeedCell", for: indexPath) as? FeedCell else { return UICollectionViewCell()}
//        guard let array = postsArray else { return UICollectionViewCell() }
//        let post = array[indexPath.item]
//        cell.post = post
//        cell.setupCell()
//        cell.delegate = self
        
//        return cell
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 300)
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        20
//    }
//}

//    MARK:- LikeImageButtonDelegate
//extension FeedViewController: LikeImageButtonDelegate {
    
    //    Создает массив пользователей, которые лайкнули публикацию и отображает их
//    func tapLikesButton(post: Post) {
//
//        block.startAnimating()
//        self.postClass.usersLikedPost(with: post.id, queue: DispatchQueue.global()) { (usersArray) in
//            guard usersArray != nil else { self.alert.createAlert {_ in
//                self.usersLikedPost = []
//                }
//                return }
//            self.usersLikedPost = usersArray
//            guard let array = self.usersLikedPost else { self.alert.createAlert {_ in}
//                return }
//
//            DispatchQueue.main.async {
//                self.block.stopAnimating()
//                self.navigationController?.pushViewController(FollowersTableViewController(usersArray: array, titleName: "Likes", user: self.user!), animated: true)
//            }
//        }
//    }
    
    //    Переход на страницу пользователя при нажатии на фото или имя
//    func tapAvatarAndUserName(post: Post) {
//
//            block.startAnimating()
//            self.userClass.user(with: post.author, queue: .global()) { (user) in
//                guard user != nil else { self.alert.createAlert {_ in}
//                    return }
//                self.user = user
//                DispatchQueue.main.async {
//                    self.block.stopAnimating()
//                    if let user = self.user {
//                        self.goToUserProfile(user: user)
//                    }
//                }
//            }
//    }
    
    //    Ставит лайк при двойном нажатии на фото
//    func tapBigLike(post: Post) {
//        postClass.likePost(with: post.id, queue: DispatchQueue.global()) { (_) in
//            DispatchQueue.main.async {
//                self.createPostsArrayWithoutBlock()
//            }
//        }
//    }
    
    //    Ставит/убирает лайк при нажатии на сердце
//    func tapLike(post: Post) {
//
//        if post.currentUserLikesThisPost {
//            postClass.unlikePost(with: post.id, queue: DispatchQueue.global()) { (_) in
//                DispatchQueue.main.async {
//                    self.createPostsArrayWithoutBlock()
//                }
//            }
//        } else {
//            postClass.likePost(with: post.id, queue: DispatchQueue.global()) { (_) in
//                DispatchQueue.main.async {
//                    self.createPostsArrayWithoutBlock()
//                }
//            }
//        }
//    }
}
