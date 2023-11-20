//
//  CollectionTableViewCell.swift
//  CollectionCellProject
//
//  Created by Apurva Jalgaonkar on 02/11/23.
//

import UIKit

class CollectionTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    static let identifier = "CollectionTableViewCell"

    static func nib() -> UINib {
        return UINib(nibName: "CollectionTableViewCell", bundle: nil)
    }

    @IBOutlet var collectionView: UICollectionView!
    var models = [DogImage]()

    override func awakeFromNib() {
        super.awakeFromNib()

        collectionView.register(MyCollectionViewCell.nib(), forCellWithReuseIdentifier: MyCollectionViewCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
    }

    func configure(with models: [DogImage]) {
        self.models = models
        collectionView.reloadData()
    }

    // UICollectionView Data Source Methods

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return models.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyCollectionViewCell.identifier, for: indexPath) as! MyCollectionViewCell
        cell.configure(with: models[indexPath.row])
        return cell
    }

    // UICollectionView Delegate Methods

//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: 250, height: 250)
//    }
}

extension CollectionTableViewCell {
    static let estimatedCellHeight: CGFloat = 250 // Estimated cell height

    func collectionViewHeight() -> CGFloat {
        // Calculate the total height of the collection view
        let numberOfItems = collectionView.numberOfItems(inSection: 0)
        let numberOfRows = CGFloat(ceil(Double(numberOfItems) / 3)) // Assuming 3 items per row
        return numberOfRows * 200  // Use the cell's height
    }

    func heightForRowAt(_ indexPath: IndexPath) -> CGFloat {
        return collectionViewHeight()
    }
}
