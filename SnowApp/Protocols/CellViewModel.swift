//
//  CellViewModel.swift
//  SnowApp
//
//  Created by Артём Бацанов on 06.12.2022.
//

import Foundation

protocol CellViewModel {
    func didTapShowMap()
    var title: String { get }
    var detailText: String { get }
}

extension CellViewModel {
    func didTapShowMap() {}
}
