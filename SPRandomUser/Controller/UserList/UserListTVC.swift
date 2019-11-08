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

    private var page = 1

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        registerCells()
        configureUI()
        fetch(page: page)
    }

    // MARK: Helpers

    private func registerCells() {
        let nib = UINib(nibName: "UserListCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "UserListCell")
    }

    private func configureUI() {
        navigationItem.title = "User List"
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 100
        tableView.tableFooterView = UIView()
    }

    private func fetch(page: Int) {
        network.fetch(page: page) { [weak self] (result) in
            switch result {
            case .success(let data):
                if let res = data.results {
                    self?.dataSource.append(contentsOf: res)
                    self?.page += 1
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
        let identifier = "UserListCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? UserListCell
        cell?.update(with: dataSource[indexPath.row])
        return cell ?? UITableViewCell()
    }
}

// MARK: - UITableViewDelegate

extension UserListTVC {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailsVC = DetailsVC.create()
        detailsVC.user = dataSource[indexPath.row]
        navigationController?.show(detailsVC, sender: self)
    }
}

// MARK: - UITableViewDataSourcePrefetching

extension UserListTVC: UITableViewDataSourcePrefetching {
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        if indexPaths.contains(where: { $0.row >= dataSource.count - 1 }) {
            fetch(page: page)
        }
    }
}
