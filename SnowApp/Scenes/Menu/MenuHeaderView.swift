////
////  MenuHeaderView.swift
////  SnowApp
////
////  Created by Артём Бацанов on 06.12.2022.
////
//
//import UIKit
//
//class MenuHeaderView: UIView {
//    // MARK: - Properties
//    
//    private let titleLabel = UILabel()
//    private let infoImageView = UIImageView()
//    
//    // MARK: - Init
//    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        setup()
//    }
//    
//    required init?(coder: NSCoder) {
//        super.init(coder: coder)
//        setup()
//    }
//    
//    // MARK: - Setup
//    
//    private func setup() {
//        setupContainer()
//        setupTitleLabel()
//        setupInfoImageView()
//    }
//    
//    private func setupContainer() {
//        backgroundColor = .white
//        layer.cornerRadius = 12
//    }
//    
//    private func setupTitleLabel() {
//        addSubview(titleLabel)
//        titleLabel.text = "Статистика по спорту:"
//        titleLabel.textAlignment = .left
//        titleLabel.numberOfLines = 0
//        titleLabel.textColor = .black
//        titleLabel.translatesAutoresizingMaskIntoConstraints = false
//        titleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 8).isActive = true
//        titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
//    }
//    
//    private func setupInfoImageView() {
//        addSubview(infoImageView)
//        let imageSize: CGFloat = 40
//        infoImageView.image = UIImage(systemName: "rosette")
//        infoImageView.tintColor = .black
//        infoImageView.contentMode = .scaleAspectFit
//        infoImageView.clipsToBounds = true
//        infoImageView.translatesAutoresizingMaskIntoConstraints = false
//        infoImageView.rightAnchor.constraint(equalTo: rightAnchor, constant: -16).isActive = true
//        infoImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
//        infoImageView.widthAnchor.constraint(equalToConstant: imageSize).isActive = true
//        infoImageView.heightAnchor.constraint(equalToConstant: imageSize).isActive = true
//
//    }
//}
