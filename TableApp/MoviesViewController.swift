//
//  MoviesViewController.swift
//  TableApp
//
//  Created by Julia Morozova on 1. 2. 2026..
//

import UIKit

class MoviesViewController: UIViewController {

    private let movies = GenreSection.createMock()

    lazy var tableView: UITableView = {
        $0.register(UITableViewCell.self, forCellReuseIdentifier: "moviesCell")
        $0.dataSource = self
        $0.delegate = self
        return $0
    }(UITableView(frame: view.frame, style: .insetGrouped))

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        title = "Список фильмов"
        navigationController?.navigationBar.prefersLargeTitles = true

        view.addSubview(tableView)
    }
}

extension MoviesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        movies[section].genres.count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        movies.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        movies[section].title
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "moviesCell", for: indexPath)

        var config = cell.defaultContentConfiguration()
        config.text = movies[indexPath.section].genres[indexPath.row].name
        config.secondaryText = movies[indexPath.section].genres[indexPath.row].description

        cell.contentConfiguration = config

        return cell

    }
}

extension MoviesViewController: UITableViewDelegate {

}



