//
//  MapCell.swift
//  SnowApp
//
//  Created by Артём Бацанов on 06.12.2022.
//

import UIKit
import MapboxMaps

private extension Constants {
    static let accessToken = "sk.eyJ1IjoibGlua3dlaSIsImEiOiJjbGJidnJxaWcwZG1iM3ZwaWt0emZwcGQ5In0.DGd9ixivweBpK3dXlqmjmA"
}

class MapCell: UITableViewCell {
    // MARK: - Properties
    
    private var mapView: MapView?
    
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    // MARK: - Setup
    
    private func setup() {
        setupMapView()
    }
    
    private func setupMapView() {
        let myResourceOptions = ResourceOptions(accessToken: Constants.accessToken)
        let myMapInitOptions = MapInitOptions(resourceOptions: myResourceOptions)
        mapView = MapView(frame: contentView.frame, mapInitOptions: myMapInitOptions)
        
        guard let mapView = mapView else { return }
        mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        mapView.gestures.delegate = self
        contentView.addSubview(mapView)
    }
}

extension MapCell: GestureManagerDelegate {
    func gestureManager(_ gestureManager: MapboxMaps.GestureManager, didBegin gestureType: MapboxMaps.GestureType) {
        print("\(gestureType) didBegin")
    }
    
    func gestureManager(_ gestureManager: MapboxMaps.GestureManager, didEnd gestureType: MapboxMaps.GestureType, willAnimate: Bool) {
        print("\(gestureType) didEnd")
    }
    
    func gestureManager(_ gestureManager: MapboxMaps.GestureManager, didEndAnimatingFor gestureType: MapboxMaps.GestureType) {
        print("didEndAnimatingFor \(gestureType)")
    }
}
