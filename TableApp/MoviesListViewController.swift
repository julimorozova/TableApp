//
//  DetailMoviesViewController.swift
//  TableApp
//
//  Created by Julia Morozova on 1. 2. 2026..
//

import UIKit

class MoviesListViewController: UIViewController {

    var genre: MovieGenre?

    lazy var tableView: UITableView = {
        $0.register(UITableViewCell.self, forCellReuseIdentifier: "moviesCell")
        $0.dataSource = self
        return $0
    }(UITableView(frame: view.frame, style: .insetGrouped))

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground

        title = genre?.name

        view.addSubview(tableView)
    }
}

extension MoviesListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        genre?.movies.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "moviesCell", for: indexPath)

        var config = cell.defaultContentConfiguration()
        
        config.text = genre?.movies[indexPath.row].title
        let rating = genre?.movies[indexPath.row].rating
        config.secondaryText = "Рейтинг: \(rating ?? 0.0)"

        cell.contentConfiguration = config

        return cell
    }
    

}
