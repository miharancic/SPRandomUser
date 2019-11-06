//
//  UserListTVC.swift
//  SPRandomUser
//
//  Created by Mihailo Rancic on 06/11/2019.
//  Copyright © 2019 Mihailo Rancic. All rights reserved.
//

import UIKit

final class UserListTVC: UITableViewController {

    // MARK: Properties

    private let network = Network()
    private var dataSource = [UserResult.User]() {
        didSet {
            tableView.reloadData()
        }
    }

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        registerCells()
        configureUI()
        fetch()
    }

    // MARK: Helpers

    private func registerCells() {
        tableView.register(UserListCell.self, forCellReuseIdentifier: UserListCell.identifier)
    }

    private func configureUI() {
        tableView.tableFooterView = UIView()
    }

    private func fetch() {
        network.fetch { [weak self] (result) in
            switch result {
            case .success(let data):
                if let res = data.results {
                    self?.dataSource.append(contentsOf: res)
                }
            case .failure(let error):
                print(error)
            }
        }
    }

}

// MARK: - UITableViewDataSource

extension UserListTVC {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = UserListCell.identifier
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? UserListCell
        cell?.update(with: dataSource[indexPath.row])
        return cell ?? UITableViewCell()
    }
}
