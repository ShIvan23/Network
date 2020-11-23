//
//  SearchTableViewController.swift
//  FirstHW
//
//  Created by Ivan on 01.11.2020.
//

import UIKit
import Kingfisher

class SearchTableViewController: UITableViewController {
    
    //    MARK: - Public Properties
    var json: RepositoryModel?
    
    //    MARK: - Private Properties
    private let headerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let countLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //    MARK: - Initializers
    init(json: RepositoryModel) {
        self.json = json
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //    MARK: - Life Cicles Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        createUI()
    }
    
    //    MARK: - Private Methods
    private func createUI() {
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: identifier)
        
        view.addSubview(headerView)
        headerView.addSubview(countLabel)
        
        let constraints = [headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                           headerView.topAnchor.constraint(equalTo: view.topAnchor),
                           headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                           headerView.heightAnchor.constraint(equalToConstant: 50),
                           
                           countLabel.centerYAnchor.constraint(equalTo: headerView.centerYAnchor),
                           countLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 16),
                           countLabel.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -16)]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let json = self.json else { return 0 }
        return json.items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! CustomTableViewCell
        guard let json = self.json else { return UITableViewCell() }
        let item = json.items[indexPath.row]
        cell.configureCell(item)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        countLabel.text = "Repositories found: \(json?.totalCount ?? 0)"
        return headerView
    }
    
    // MARK: - Table view delegate
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 70
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let url = json?.items[indexPath.row].owner.htmlUrl
        let vc = WebViewController()
        vc.URLString = url
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
