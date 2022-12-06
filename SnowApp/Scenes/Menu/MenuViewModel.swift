//
//  MenuViewModel.swift
//  SnowApp
//
//  Created by Артём Бацанов on 06.12.2022.
//

import UIKit

class MenuViewModel {
    // MARK: - Properties
    
    private(set) var menuSections = [MenuOption]()
        
    // MARK: - Init
    
    init() {
        simulateFetchResortsFromNetwork()
    }
    
    // MARK: - Public methods
    
    func numberOfRowsInSection(_ section: Int) -> Int {
        switch menuSections[section] {
        case .statistic(let items):
            return items.count
        case .map:
            return 1
        case .resort(let items):
            return items.count
        }
    }
    
    func setHeightCellInSection(indexPath: IndexPath) -> CGFloat {
        indexPath.section == 1 ? 200 : 60
    }
    
    func testConfigure(indexPath: IndexPath) -> CellViewModel {
        switch menuSections[indexPath.section] {
        case .statistic(let items):
            return StatisticCellViewModel(option: items[indexPath.row])
        case .map: break
        case .resort(let items):
            return ResortCellViewModel(resort: items[indexPath.row])
        }
        return StatisticCellViewModel(option: .activeDays)
    }
    
    func heightForHeader(_ section: Int) -> CGFloat {
        return section == 0 ? 60 : 0
    }
    
    // MARK: - Private methods
    
    private func simulateFetchResortsFromNetwork() {
        menuSections.append(MenuOption.statistic(items: [StatisticOption.activeDays, StatisticOption.descents,
                                                         StatisticOption.distance, StatisticOption.maxSpeed]))
        menuSections.append(MenuOption.map)
        menuSections.append(MenuOption.resort(items: [Resort(title: "Роза Хутор", numberOfVisits: "11"),
                                                      Resort(title: "Иня", numberOfVisits: "5"),
                                                      Resort(title: "Горский", numberOfVisits: "3"),
                                                      Resort(title: "Альбатрос", numberOfVisits: "2"),
                                                      Resort(title: "Евразия", numberOfVisits: "1")]))
    }
}
