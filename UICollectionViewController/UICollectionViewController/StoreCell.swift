//
//  StoreCell.swift
//  UICollectionViewController
//
//  Created by Алексей Смицкий on 05.09.2020.
//  Copyright © 2020 Смицкий А.Д. All rights reserved.
//

import UIKit

// MARK: - StoreCell

final class StoreCell: UICollectionViewCell {
    
    // MARK: - Public properties
    
    public lazy var typeName = UILabel()
    public var cellData: CustomData? {
        didSet {
            guard let data = cellData else { return }
            imageViewCell.image = data.image
            typeName.text = data.label
        }
    }
    
    // MARK: - Private properties
    
    private lazy var imageViewCell = UIImageView()
    
    // MARK: - Initalization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        addViews()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError(Constants.errorText)
    }
    
    // MARK: - Private methods
    
    private func layout() {
        
        imageViewCell.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageViewCell.topAnchor.constraint(
                equalTo: contentView.topAnchor),
            imageViewCell.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor),
            imageViewCell.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor),
            imageViewCell.widthAnchor.constraint(
                equalToConstant: Constants.imageViewWidth),
            imageViewCell.heightAnchor.constraint(
                equalToConstant: Constants.imageViewHeight)])
        
        typeName.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            typeName.topAnchor.constraint(
                equalTo: imageViewCell.bottomAnchor),
            typeName.centerXAnchor.constraint(
                equalTo: imageViewCell.centerXAnchor)])
    }
}

// MARK: - Setups

private extension StoreCell {
    
    func setupViews() {
        setImageCell()
        setTypeName()
    }
    
    func setImageCell() {
        imageViewCell.contentMode = .scaleAspectFit
        imageViewCell.clipsToBounds = true
        imageViewCell.layer.cornerRadius = Constants.imageViewCorner
    }
    
    func setTypeName() {
        typeName.backgroundColor = .white
        typeName.font = .systemFont(ofSize: Constants.labelFont)
        typeName.clipsToBounds = true
    }
}

// MARK: - Setup Elements

private extension StoreCell {
    
    func addViews() {
        contentView.addSubview(imageViewCell)
        contentView.addSubview(typeName)
    }
}

// MARK: - Constants

private extension StoreCell {
    
    enum Constants {
        
        static let imageViewWidth: CGFloat = 100
        static let imageViewHeight: CGFloat = 100
        static let imageViewCorner: CGFloat = 5
        
        static let labelFont: CGFloat = 20
        
        static let errorText: String = "init(coder:) has not been implemented"
    }
}
