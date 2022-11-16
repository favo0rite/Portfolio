//
//  UsersListViewController.swift
//  Portfolio
//
//  Created by Pavel Zamotaev on 03.11.2022.
//

import UIKit
import SnapKit

class UsersListViewController: UIViewController {

    // MARK: Views
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UserTableViewCell.self, forCellReuseIdentifier: Constants.cellId)
        return tableView
    }()

    // MARK: Properties
    
    let users = User.makeMockData()
    
    // MARK: Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationController()
        setupViews()
    }
    
    // MARK: Setup views

    private func configureNavigationController() {
        navigationController?.view.backgroundColor = .white
    }

    private func setupViews() {
        view.addSubview(tableView)
    
        tableView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.leading.bottom.trailing.equalToSuperview()
        }
    }
}

extension UsersListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellId, for: indexPath) as! UserTableViewCell
        let name = users[indexPath.row].name ?? ""
        let surname = users[indexPath.row].surname ?? ""
        let fullName = name + " " + surname
        

        cell.fullNameLabel.text = fullName
        return cell
    }
}

extension UsersListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        50
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let userInfoViewController = UserInfoViewController()
        let name = users[indexPath.row].name ?? ""
        let surname = users[indexPath.row].surname ?? ""
        let post = users[indexPath.row].post ?? ""
        let adress = users[indexPath.row].adress ?? ""
        let avatarImage = users[indexPath.row].avatarImage ?? UIImage(named: "Personality")
        
        let user = User(name: name, surname: surname, post: post, adress: adress, avatarImage: avatarImage)
        userInfoViewController.user = user
        self.navigationController?.pushViewController(userInfoViewController, animated: true)
    }
    
}
