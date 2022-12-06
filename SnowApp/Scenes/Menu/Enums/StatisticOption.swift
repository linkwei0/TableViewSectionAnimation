//
//  MenuOption.swift
//  SnowApp
//
//  Created by Артём Бацанов on 06.12.2022.
//

import Foundation

enum StatisticOption: String {
    case activeDays, descents, distance, maxSpeed, map
    
    var title: String {
        switch self {
        case .activeDays: return "Активные дни"
        case .descents: return "Спуски"
        case .distance: return "Расстояние"
        case .maxSpeed: return "Макс. скорость"
        case .map: return "Карта"
        }
    }
    
    var counterText: String {
        switch self {
        case .activeDays: return "27"
        case .descents: return "41"
        case .distance: return "16.9 км/ч"
        case .maxSpeed: return "100.0 км/ч"
        case .map: return ""
        default: return ""
        }
    }
}
