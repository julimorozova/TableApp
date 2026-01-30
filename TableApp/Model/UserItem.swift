//
//  UserItem.swift
//  TableApp
//
//  Created by Julia Morozova on 30. 1. 2026..
//

import Foundation

struct UserItem {
    var avatar: String
    var name: String
    var status: String

    static func mockData() -> [[UserItem]] {

        let favorites = [
            UserItem(avatar: "star.circle.fill", name: "Анна Петрова", status: "Онлайн"),
            UserItem(avatar: "star.circle.fill", name: "Алексей Смирнов", status: "Печатает...")
        ]

        let allFriends = [
            UserItem(avatar: "person.crop.circle", name: "Виктор Иванов", status: "Был в сети в 12:40"),
            UserItem(avatar: "person.crop.circle", name: "Дарья Кузнецова", status: "В сети"),
            UserItem(avatar: "person.crop.circle", name: "Елена Соколова", status: "Занята"),
            UserItem(avatar: "person.crop.circle", name: "Игорь Морозов", status: "Был в сети вчера"),
            UserItem(avatar: "person.crop.circle", name: "Марина Волкова", status: "В сети")
        ]

        return [favorites, allFriends]
    }
}
