//
//  MenuCellViewModel.swift
//  SnowApp
//
//  Created by Артём Бацанов on 06.12.2022.
//

import Foundation

class ResortCellViewModel: CellViewModel {
    // MARK: - Properties
    
    var title: String {
        return resort.title
    }
    
    var detailText: String {
        return resort.numberOfVisits
    }
    
    private let resort: Resort
    
    // MARK: - Init
    
    init(resort: Resort) {
        self.resort = resort
    }
}
