//
//  MapCellViewModel.swift
//  SnowApp
//
//  Created by Артём Бацанов on 06.12.2022.
//

import Foundation

protocol MapCellViewModelDelegate: AnyObject {
    func viewModelDidRequestToExpandMapView(_ viewModel: MapCellViewModel)
}

class MapCellViewModel {
    weak var delegate: MapCellViewModelDelegate?
}

extension MapCellViewModel: CellViewModel {
    var title: String { "" }
    var detailText: String { "" }
    
    func didTapShowMap() {
        delegate?.viewModelDidRequestToExpandMapView(self)
    }
}
