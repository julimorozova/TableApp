//
//  ViewController.swift
//  TableApp
//
//  Created by Julia Morozova on 30. 1. 2026..
//

import UIKit

class ViewController: UIViewController {

    private let settings = SettingsItem.mockData()

    private lazy var tableView: UITableView = {
        $0.register(UITableViewCell.self, forCellReuseIdentifier: "settingsCell")
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

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        settings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // происходит переиспользование ячейки

        let cell = tableView.dequeueReusableCell(withIdentifier: "settingsCell", for: indexPath)

        //устаревший способ добавление содержимого ячейки
        //cell.textLabel?.text = users[indexPath.row]

        //современный

        var config = cell.defaultContentConfiguration()

        config.text = settings[indexPath.row].title
        config.secondaryText = settings[indexPath.row].subtitle
        config.image = UIImage(systemName: settings[indexPath.row].icon)

        cell.contentConfiguration = config

        return cell

    }
}

extension ViewController: UITableViewDelegate {
    // способ взаимодествия с таблицей, понять, что вообще произошло
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let index = indexPath.row
        print(settings[index])
    }
}

// 1
// создаем массив данных
//2
// создать таблицу
//3
// регистрация ячейки
// 4
// создать datasourse и настроить 2 метода
// 5
// подписать таблицу под datasourse
