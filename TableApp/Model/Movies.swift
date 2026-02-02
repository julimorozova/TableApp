//
//  Movies.swift
//  TableApp
//
//  Created by Julia Morozova on 1. 2. 2026..
//


import Foundation

struct Movie {
    let title: String
    let rating: Double
}

struct MovieGenre {
    let id = UUID()
    let name: String
    let description: String
    let movies: [Movie] // <-- Добавили список фильмов
}

struct GenreSection {
    let title: String
    var genres: [MovieGenre]

    static func createMock() -> [GenreSection] {
        [
            GenreSection(title: "Популярные", genres: [
                MovieGenre(name: "Экшен", description: "Много взрывов", movies: [
                    Movie(title: "Безумный Макс", rating: 8.1),
                    Movie(title: "Джон Уик", rating: 7.4)
                ]),
                MovieGenre(name: "Комедия", description: "Смех продлевает жизнь", movies: [
                    Movie(title: "Мальчишник в Вегасе", rating: 7.7),
                    Movie(title: "Джентльмены удачи", rating: 8.5)
                ])
            ]),
            GenreSection(title: "Другие", genres: [
                MovieGenre(name: "Ужасы", description: "Страшно, вырубай", movies: [
                    Movie(title: "Заклятие", rating: 7.5),
                    Movie(title: "Оно", rating: 7.3)
                ])
            ])
        ]
    }
}
