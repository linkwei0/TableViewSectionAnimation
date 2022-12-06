//
//  MenuOption.swift
//  SnowApp
//
//  Created by Артём Бацанов on 06.12.2022.
//

import Foundation

enum MenuOption {
    case statistic(items: [StatisticOption])
    case map
    case resort(items: [Resort])
}
