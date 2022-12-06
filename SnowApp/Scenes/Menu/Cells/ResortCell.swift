//
//  MenuCell.swift
//  SnowApp
//
//  Created by Артём Бацанов on 06.12.2022.
//

import UIKit

class ResortCell: UITableViewCell {
    // MARK: - Properties
    
    private let mainImage = UIImageView()
    private let titleLabel = UILabel()
    private let counterLabel = UILabel()
    
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    // MARK: - Configure
    
    func configure(with viewModel: CellViewModel) {
        titleLabel.text = viewModel.title
        counterLabel.text = viewModel.detailText
    }
    
    // MARK: - Setup
    
    private func setup() {
        setupMainImage()
        setupTitleLabel()
        setupCounterLabel()
    }
    
    private func setupMainImage() {
        contentView.addSubview(mainImage)
        let imageSize: CGFloat = 30
        mainImage.image = UIImage(systemName: "house")
        mainImage.tintColor = .black
        mainImage.contentMode = .scaleAspectFit
        mainImage.clipsToBounds = true
        mainImage.translatesAutoresizingMaskIntoConstraints = false
        mainImage.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16).isActive = true
        mainImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        mainImage.widthAnchor.constraint(equalToConstant: imageSize).isActive = true
        mainImage.heightAnchor.constraint(equalToConstant: imageSize).isActive = true
    }
    
    private func setupTitleLabel() {
        contentView.addSubview(titleLabel)
        titleLabel.tintColor = .black
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.leftAnchor.constraint(equalTo: mainImage.rightAnchor, constant: 12).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
    }
    
    private func setupCounterLabel() {
        contentView.addSubview(counterLabel)
        counterLabel.tintColor = .black
        counterLabel.translatesAutoresizingMaskIntoConstraints = false
        counterLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16).isActive = true
        counterLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
    }
}
