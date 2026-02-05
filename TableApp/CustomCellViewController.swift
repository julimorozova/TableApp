//
//  CastomCellViewController.swift
//  TableApp
//
//  Created by Julia Morozova on 3. 2. 2026..
//

import UIKit

class CastomCellViewController: UIViewController {

    var data = MockDataService.getMockPosts()


    lazy var tableView: UITableView = {
        $0.register(CastomCellTableViewCell.self, forCellReuseIdentifier: "customCell")
        $0.dataSource = self
        $0.separatorStyle = .none
        return $0
    }(UITableView(frame: view.frame, style: .plain))

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground

        view.addSubview(tableView)
    }


}

extension CastomCellViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as? CastomCellTableViewCell {
            cell.setupCell(data : data[indexPath.row])
            cell.selectionStyle = .none
            return cell
        }
        return UITableViewCell()
    }
    

}
