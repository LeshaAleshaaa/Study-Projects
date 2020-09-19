//
//  ViewController.swift
//  UICollectionViewController
//
//  Created by Алексей Смицкий on 03.09.2020.
//  Copyright © 2020 Смицкий А.Д. All rights reserved.
//

import UIKit

// MARK: - MainViewController

final class MainViewController: UIViewController {
    
    // MARK: - Private properties
    
    private lazy var collectionIdentifier = Constants.identifier
    private lazy var collectionLayout = UICollectionViewFlowLayout()
    private lazy var collectionView = UICollectionView(frame: .zero,
                                                       collectionViewLayout: collectionLayout)
    private lazy var cellSetups = [Constants.notebooksType,
                                   Constants.phonesType,
                                   Constants.iMacType,
                                   Constants.airPodsType]
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        addViews()
        layout()
    }
    
    // MARK: - Private methods
    
    private func layout() {
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(
                equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(
                equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(
                equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(
                equalTo: view.bottomAnchor)])
    }
}

// MARK: - CollectionView Extension

extension MainViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cellSetups.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath)
        -> UICollectionViewCell {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: collectionIdentifier, for: indexPath)
                as? StoreCell {
                cell.cellData = self.cellSetups[indexPath.row]
                cell.typeName.tag = indexPath.row
                cell.clipsToBounds = true
                cell.layer.cornerRadius = Constants.cellCorner
                cell.layer.borderWidth = Constants.cellBorder
                cell.layer.borderColor = Constants.cellColor
                
                return cell
            }
            return StoreCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            let second = TrashViewController()
            present(second, animated: true, completion: nil)
        default:
            break
        }
    }
}

// MARK: - Setups

private extension MainViewController {
    
    func setupViews() {
        setCollectionView()
    }
    
    func setCollectionView() {
        collectionView.register(StoreCell.self, forCellWithReuseIdentifier: collectionIdentifier)
        collectionLayout.scrollDirection = .vertical
        collectionLayout.itemSize = Constants.cellSize
        collectionView.backgroundColor = .white
        collectionView.dataSource = self
        collectionView.delegate = self
    }
}

// MARK: - Setup Elements

private extension MainViewController {
    
    func addViews() {
        view.addSubview(collectionView)
    }
    
    func setCollection() {
        
    }
}

// MARK: - Constants

private extension MainViewController {
    
    enum Constants {
        static let identifier: String = "collection"
        
        static let notebooksType: CustomData = CustomData(label: "Ноутбуки", image: UIImage(named: "macbookPro"))
        static let phonesType: CustomData = CustomData(label: "Телефоны", image: UIImage(named: "iPhone11"))
        static let iMacType: CustomData = CustomData(label: "Моноблоки", image: UIImage(named: "iMac"))
        static let airPodsType: CustomData = CustomData(label: "Наушники", image: UIImage(named: "airpodsPro"))
        
        static let cellCorner: CGFloat = 15
        static let cellBorder: CGFloat = 1.5
        static let cellColor: CGColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        
        static let cellSize: CGSize = CGSize(width: 150, height: 150)
    }
}
