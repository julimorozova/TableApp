//
//  SettingsItem.swift
//  TableApp
//
//  Created by Julia Morozova on 30. 1. 2026..
//

import Foundation

struct SettingsItem {
    var icon: String
    var title: String
    var subtitle: String

    static func mockData() -> [SettingsItem] {
        [
            SettingsItem(icon: "gearshape", title: "Основные", subtitle: "Обновление ПО, хранилище"),
                    SettingsItem(icon: "display", title: "Экран и яркость", subtitle: "Темная тема, размер текста"),
                    SettingsItem(icon: "lock.shield", title: "Конфиденциальность", subtitle: "Геолокация, камера"),
                    SettingsItem(icon: "wifi", title: "Wi-Fi", subtitle: "Beeline_Home"),
                    SettingsItem(icon: "dot.radiowaves.left.and.right", title: "Bluetooth", subtitle: "Вкл."),
                    SettingsItem(icon: "battery.100", title: "Аккумулятор", subtitle: "Состояние: 98%"),
                    SettingsItem(icon: "moon.fill", title: "Фокусирование", subtitle: "Не беспокоить")
        ]
    }
}
