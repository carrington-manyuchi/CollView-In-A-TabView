//
//  CollectionViewCell.swift
//  CollView-In-A-TabView
//
//  Created by DA MAC M1 157 on 2023/09/07.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    public static let identifier = "CollectionViewCell"
    
    private let cellLayer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false

        view.layer.cornerRadius = 19
        view.layer.shadowOffset = CGSize(width: 3, height: -7)
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowRadius = 0.8
        return view
    }()
    
    private let myLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.text = "Trial"
        label.textAlignment = .center
        return label
    }()
    
    private let myImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "1")
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    
    public func configure(with models: Model) {
        myLabel.text = models.text
        myImageView.image = UIImage(named: models.imageName)
        setupUI()
    }
    
    
    private func setupUI() {
        contentView.addSubview(cellLayer)
        cellLayer.addSubview(myLabel)
        cellLayer.addSubview(myImageView)
        cellLayer.layer.backgroundColor = UIColorFromRGB(rgbValue: 0xEDEDED).cgColor
        
        setupConstraints()
    }
    
    func UIColorFromRGB(rgbValue: UInt) -> UIColor {
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    
    private func setupConstraints() {
        let cellLayerConstraints = [
            cellLayer.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            cellLayer.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            cellLayer.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            cellLayer.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ]
        
        let myImageViewConstraints = [
            myImageView.topAnchor.constraint(equalTo: cellLayer.topAnchor),
            myImageView.leadingAnchor.constraint(equalTo: cellLayer.leadingAnchor),
            myImageView.trailingAnchor.constraint(equalTo: cellLayer.trailingAnchor),
            myImageView.centerXAnchor.constraint(equalTo: cellLayer.centerXAnchor)
        ]
        
        let myLabelConstraints = [
            myLabel.topAnchor.constraint(equalTo: myImageView.bottomAnchor, constant: 10),
            myLabel.leadingAnchor.constraint(equalTo: cellLayer.leadingAnchor),
            myLabel.trailingAnchor.constraint(equalTo: cellLayer.trailingAnchor),
            myLabel.heightAnchor.constraint(equalToConstant: 52),
            myLabel.bottomAnchor.constraint(equalTo: cellLayer.bottomAnchor)
        ]
        
        NSLayoutConstraint.activate(cellLayerConstraints)
        NSLayoutConstraint.activate(myLabelConstraints)
        NSLayoutConstraint.activate(myImageViewConstraints)
    }
}
