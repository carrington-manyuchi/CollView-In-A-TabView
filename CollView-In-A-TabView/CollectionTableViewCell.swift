//
//  TableViewCell.swift
//  CollView-In-A-TabView
//
//  Created by DA MAC M1 157 on 2023/09/07.
//

import UIKit

class CollectionTableViewCell: UITableViewCell {
    
    public static let identifier = "TableViewCell"
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
