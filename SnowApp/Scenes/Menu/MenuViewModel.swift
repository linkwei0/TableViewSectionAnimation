//
//  MenuViewModel.swift
//  SnowApp
//
//  Created by Артём Бацанов on 06.12.2022.
//

import UIKit

class MenuViewModel {
    // MARK: - Properties
    
    var onDidExpandMap: (() -> Void)?
    
    private(set) var menuSections: [MenuOption] = [MenuOption.statistic(items: [
        StatisticOption.activeDays,
        StatisticOption.descents,
        StatisticOption.distance,
        StatisticOption.maxSpeed
    ])]
        
    // MARK: - Public methods
    
    func viewIsReady() {
        update()
    }
    
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
    
    func createCellViewModel(indexPath: IndexPath) -> CellViewModel {
        switch menuSections[indexPath.section] {
        case .statistic(let items):
            return StatisticCellViewModel(option: items[indexPath.row])
        case .map:
            let viewModel = MapCellViewModel()
            viewModel.delegate = self
            return viewModel
        case .resort(let items):
            return ResortCellViewModel(resort: items[indexPath.row])
        }
    }
    
    // MARK: - Private methods
    
    private func update() {
        menuSections.append(MenuOption.map)
        menuSections.append(MenuOption.resort(items: [Resort(title: "Роза Хутор", numberOfVisits: "11"),
                                                      Resort(title: "Иня", numberOfVisits: "5"),
                                                      Resort(title: "Горский", numberOfVisits: "3"),
                                                      Resort(title: "Альбатрос", numberOfVisits: "2"),
                                                      Resort(title: "Евразия", numberOfVisits: "1")]))
    }
}

// MARK: - MapCellViewModelDelegate

extension MenuViewModel: MapCellViewModelDelegate {
    func viewModelDidRequestToExpandMapView(_ viewModel: MapCellViewModel) {
        onDidExpandMap?()
    }
}
