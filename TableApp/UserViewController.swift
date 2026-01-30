//
//  UserViewController.swift
//  TableApp
//
//  Created by Julia Morozova on 30. 1. 2026..
//

import UIKit

class UserViewController: UIViewController {
    private let users = UserItem.mockData()

    private lazy var tableView: UITableView = {
        $0.register(UITableViewCell.self, forCellReuseIdentifier: "userCell")
        $0.dataSource = self
        $0.delegate = self
        return $0
    }(UITableView(frame: view.frame, style: .insetGrouped))

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground

        view.addSubview(tableView)
    }

}

extension UserViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return section == 0 ? "Здесь расположены ваши частые контакты" : nil
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return section == 0 ? "Избранные" : "Все друзья"
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        users.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        users[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath)
        let user = users[indexPath.section][indexPath.row]
        var config = cell.defaultContentConfiguration()

        config.text = user.name
        config.secondaryText = user.status
        config.image = UIImage(systemName: user.avatar)

        cell.contentConfiguration = config

        return cell
    }
}

extension UserViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.section, indexPath.row)
    }
}
