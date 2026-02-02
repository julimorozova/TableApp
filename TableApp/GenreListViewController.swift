//
//  MoviesViewController.swift
//  TableApp
//
//  Created by Julia Morozova on 1. 2. 2026..
//

import UIKit

class GenreListViewController: UIViewController {

    private var genreList = GenreSection.createMock()

    lazy var tableView: UITableView = {
        $0.register(UITableViewCell.self, forCellReuseIdentifier: "ganresCell")
        $0.dataSource = self
        $0.delegate = self
        return $0
    }(UITableView(frame: view.frame, style: .insetGrouped))

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        title = "Список жанров"
        navigationController?.navigationBar.prefersLargeTitles = true

        view.addSubview(tableView)
    }
}

extension GenreListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        genreList[section].genres.count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        genreList.count
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        genreList[section].title
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ganresCell", for: indexPath)

        var config = cell.defaultContentConfiguration()
        config.text = genreList[indexPath.section].genres[indexPath.row].name
        config.secondaryText = genreList[indexPath.section].genres[indexPath.row].description

        cell.contentConfiguration = config

        return cell

    }
}

extension GenreListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            genreList[indexPath.section].genres.remove(at: indexPath.row)

            if genreList[indexPath.section].genres.isEmpty {
                genreList.remove(at: indexPath.section)
                tableView.deleteSections(IndexSet(integer: indexPath.section), with: .automatic)
            } else {
                tableView.deleteRows(at:  [indexPath], with: .automatic)
            }
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = MoviesListViewController()
        vc.genre = genreList[indexPath.section].genres[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
}



