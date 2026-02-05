//
//  CastomCellViewController.swift
//  TableApp
//
//  Created by Julia Morozova on 3. 2. 2026..
//

import UIKit

class CustomCellViewController: UIViewController {

    var data = MockDataService.getMockPosts()


    lazy var tableView: UITableView = {
        $0.register(CustomCellTableViewCell.self, forCellReuseIdentifier: "customCell")
        $0.dataSource = self
        $0.delegate = self
        $0.separatorStyle = .none
        return $0
    }(UITableView(frame: view.frame, style: .plain))

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground

        view.addSubview(tableView)
    }

}

extension CustomCellViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as? CustomCellTableViewCell {
            cell.setupCell(data : data[indexPath.row])
            cell.selectionStyle = .none
            return cell
        }
        return UITableViewCell()
    }

}

extension CustomCellViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailsCastomCellViewController(data: data[indexPath.row])
        navigationController?.pushViewController(vc, animated: true)
    }
}
