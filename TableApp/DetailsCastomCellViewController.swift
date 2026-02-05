//
//  DetailsCastomCellViewController.swift
//  TableApp
//
//  Created by Julia Morozova on 5. 2. 2026..
//

import UIKit

class DetailsCastomCellViewController: UIViewController {

    var data: PostData

    init(data: PostData) {
            self.data = data
            super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var userAvatar: UIImageView = {
        $0.layer.cornerRadius = 30
        //$0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIImageView())

    lazy var userName: UILabel = {
        $0.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())

    lazy var postImage: UIImageView = {
        $0.layer.cornerRadius = 30
        $0.clipsToBounds = true
        $0.contentMode = .scaleAspectFill
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIImageView())

    lazy var postText: UILabel = {
        $0.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        $0.numberOfLines = 0
        $0.lineBreakMode = .byWordWrapping
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())


    override func viewDidLoad() {
        super.viewDidLoad()

        userAvatar.image = UIImage(named: data.userAvatar)
        userName.text = data.userName
        postImage.image = UIImage(named: data.postImage)
        postText.text = data.description

        view.backgroundColor = .systemBackground

        view.addSubview(userAvatar)
        view.addSubview(userName)
        view.addSubview(postImage)
        view.addSubview(postText)

        createConstraints()
    }

    func createConstraints() {
        NSLayoutConstraint.activate([
            userAvatar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 44),
            userAvatar.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            userAvatar.heightAnchor.constraint(equalToConstant: 60),
            userAvatar.widthAnchor.constraint(equalToConstant: 60),

            userName.topAnchor.constraint(equalTo: userAvatar.bottomAnchor, constant: 15),
            userName.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            postImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            postImage.topAnchor.constraint(equalTo: userName.bottomAnchor, constant: 42),
            postImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            postImage.heightAnchor.constraint(equalToConstant: 260),

            postText.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            postText.topAnchor.constraint(equalTo: postImage.bottomAnchor, constant: 34),
            postText.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ])
    }

}
