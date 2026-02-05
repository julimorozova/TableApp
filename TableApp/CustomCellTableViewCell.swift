//
//  CastomCellTableViewCell.swift
//  TableApp
//
//  Created by Julia Morozova on 3. 2. 2026..
//

import UIKit

class CastomCellTableViewCell: UITableViewCell {

    lazy var viewCell: UIView = {
        $0.backgroundColor = .systemGray6
        $0.layer.cornerRadius = 21
        $0.clipsToBounds = true
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIView())

    lazy var userAvatar: UIImageView = {
        $0.backgroundColor = .systemGray
        $0.layer.cornerRadius = 17
        $0.clipsToBounds = true
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIImageView())

    lazy var userName: UILabel = {
        $0.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())

    lazy var postImage: UIImageView = {
        $0.backgroundColor = .systemGray
        $0.layer.cornerRadius = 30
        $0.clipsToBounds = true
        $0.contentMode = .scaleAspectFill
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIImageView())

    lazy var postDate: UILabel = {
        $0.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())

    lazy var postText: UILabel = {
        $0.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        $0.numberOfLines = 0
        $0.lineBreakMode = .byWordWrapping
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//
//    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func setupCell(data: PostData) {
        userAvatar.image = UIImage(named: data.userAvatar)
        userName.text = data.userName
        postImage.image = UIImage(named: data.postImage)
        postDate.text = data.date
        postText.text = data.description


        contentView.addSubview(viewCell)
        viewCell.addSubview(userAvatar)
        viewCell.addSubview(userName)
        viewCell.addSubview(postImage)
        viewCell.addSubview(postDate)
        viewCell.addSubview(postText)

        createConstraints()
    }

    private func createConstraints() {
        NSLayoutConstraint.activate([
            viewCell.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            viewCell.topAnchor.constraint(equalTo: contentView.topAnchor),
            viewCell.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            viewCell.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -14),

            userAvatar.leadingAnchor.constraint(equalTo: viewCell.leadingAnchor, constant: 14),
            userAvatar.topAnchor.constraint(equalTo: viewCell.topAnchor, constant: 14),
            userAvatar.heightAnchor.constraint(equalToConstant: 35),
            userAvatar.widthAnchor.constraint(equalToConstant: 35),

            userName.leadingAnchor.constraint(equalTo: userAvatar.trailingAnchor, constant: 8),
            userName.trailingAnchor.constraint(equalTo: viewCell.trailingAnchor, constant: -14),
            userName.centerYAnchor.constraint(equalTo: userAvatar.centerYAnchor),

            postImage.leadingAnchor.constraint(equalTo: viewCell.leadingAnchor, constant: 14),
            postImage.topAnchor.constraint(equalTo: userAvatar.bottomAnchor, constant: 11),
            postImage.trailingAnchor.constraint(equalTo: viewCell.trailingAnchor, constant: -14),
            postImage.heightAnchor.constraint(equalToConstant: 174),

            postDate.leadingAnchor.constraint(equalTo: viewCell.leadingAnchor, constant: 32),
            postDate.topAnchor.constraint(equalTo: postImage.bottomAnchor, constant: 6),
            postDate.trailingAnchor.constraint(equalTo: viewCell.trailingAnchor, constant: -14),

            postText.leadingAnchor.constraint(equalTo: viewCell.leadingAnchor, constant: 14),
            postText.topAnchor.constraint(equalTo: postDate.bottomAnchor, constant: 14),
            postText.trailingAnchor.constraint(equalTo: viewCell.trailingAnchor, constant: -14),


            postText.bottomAnchor.constraint(equalTo: viewCell.bottomAnchor, constant: -14),
        ])
    }

}
