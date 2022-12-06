//
//  StatisticCellViewModel.swift
//  SnowApp
//
//  Created by Артём Бацанов on 06.12.2022.
//

import Foundation

class StatisticCellViewModel: CellViewModel {
    
    var title: String {
        return option.title
    }
    
    var detailText: String {
        return option.counterText
    }
    
    private let option: StatisticOption
    
    init(option: StatisticOption) {
        self.option = option
    }
}
