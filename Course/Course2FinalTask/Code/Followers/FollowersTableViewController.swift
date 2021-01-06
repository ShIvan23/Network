//
//  FollowersTableViewController.swift
//  Course2FinalTask
//
//  Created by Ivan on 01.08.2020.
//  Copyright © 2020 e-Legion. All rights reserved.
//

import UIKit

class FollowersTableViewController: UITableViewController {
    
    //    MARK: - Pricate Properties
    private var usersArray = [User]()
    private var titleName: String
    private lazy var alert = AlertViewController(view: self)
    
    //    MARK: - Initilizers
    init(usersArray: [User], titleName: String) {
        self.usersArray = usersArray
        self.titleName = titleName
        super.init(style: .plain)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //    MARK: - Life Cycles Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(FollowersCell.self, forCellReuseIdentifier: identifier)
        title = titleName
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usersArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? FollowersCell else { return UITableViewCell() }
        let user = usersArray[indexPath.row]
        cell.createCell(user: user)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        goToUserProfile(user: usersArray[indexPath.row])
    }
    
    //    MARK: - Private Methods
    //    Переход в профиль пользователя
    private func goToUserProfile(user: User) {
        let storyboard = UIStoryboard(name: "Storyboard", bundle: nil)
        guard let profileVC = storyboard.instantiateViewController(withIdentifier: "ProfileViewController") as? ProfileViewController else { alert.createAlert(error: nil)
            return }
        profileVC.user = user
        show(profileVC, sender: nil)
    }
}
