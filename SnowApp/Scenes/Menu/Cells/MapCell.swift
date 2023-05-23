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
    
    var mapView: MapView?
    private lazy var expandMapButton = UIButton()
    private var viewModel: CellViewModel?
    
    // MARK: - Init
    
    override func prepareForReuse() {
        super.prepareForReuse()
        mapView = nil
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    // MARK: - Configure
    
    func configure(with viewModel: CellViewModel) {
        self.viewModel = viewModel
    }
    
    // MARK: - Setup
    
    private func setup() {
        setupMapView()
        setupOpenMapButton()
    }
    
    private func setupMapView() {
        let myResourceOptions = ResourceOptions(accessToken: Constants.accessToken)
        let myMapInitOptions = MapInitOptions(resourceOptions: myResourceOptions)
        mapView = MapView(frame: .zero, mapInitOptions: myMapInitOptions)
        
        guard let mapView = mapView else { return }
        mapView.gestures.delegate = self
        mapView.ornaments.logoView.isHidden = true
        mapView.ornaments.attributionButton.isHidden = true
        contentView.addSubview(mapView)
        mapView.translatesAutoresizingMaskIntoConstraints = false
        mapView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        mapView.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        mapView.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        mapView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
    
    private func setupOpenMapButton() {
        guard let mapView = mapView else { return }
        let buttonSize: CGFloat = 16
        mapView.addSubview(expandMapButton)
        expandMapButton.addTarget(self, action: #selector(didTapExpandMapButton), for: .touchUpInside)
        expandMapButton.setImage(UIImage(named: "expand"), for: .normal)
        expandMapButton.tintColor = .black
        expandMapButton.translatesAutoresizingMaskIntoConstraints = false
        expandMapButton.rightAnchor.constraint(equalTo: mapView.rightAnchor, constant: -12).isActive = true
        expandMapButton.bottomAnchor.constraint(equalTo: mapView.bottomAnchor, constant: -12).isActive = true
        expandMapButton.heightAnchor.constraint(equalToConstant: buttonSize).isActive = true
        expandMapButton.widthAnchor.constraint(equalToConstant: buttonSize).isActive = true
    }
    
    // MARK: - IBActions
    
    @objc private func didTapExpandMapButton() {
        viewModel?.didTapShowMap()
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
