//
//  Movies.swift
//  TableApp
//
//  Created by Julia Morozova on 1. 2. 2026..
//


import Foundation

struct MovieGenre {
    let id = UUID()
    let name: String
    let description: String
}

struct GenreSection {
    let title: String
    var genres: [MovieGenre]

    static func createMock() -> [GenreSection] {
        [
        GenreSection(title: "Популярные", genres: [
                MovieGenre(name: "Экшен", description: "Много взрывов и погонь"),
                MovieGenre(name: "Комедия", description: "Чтобы посмеяться"),
                MovieGenre(name: "Драма", description: "Глубокие переживания")
            ]),
            GenreSection(title: "Другие", genres: [
                MovieGenre(name: "Ужасы", description: "Будет страшно"),
                MovieGenre(name: "Документальный", description: "Реальные факты")
            ]),
        ]
    }
}
