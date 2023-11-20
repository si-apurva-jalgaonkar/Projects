//
//  MyCollectionViewCell.swift
//  CollectionCellProject
//
//  Created by Apurva Jalgaonkar on 02/11/23.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {
    @IBOutlet var myLabel: UILabel!
    @IBOutlet var myImageView: UIImageView!

    static let identifier = "MyCollectionViewCell"

    static func nib() -> UINib {
        return UINib(nibName: "MyCollectionViewCell", bundle: nil)
    }
    
    public func configure(with model: DogImage) {
        myLabel.text = model.localized_name

        // Load the image from the URL
        if let imageUrl = URL(string: model.img) {
            DispatchQueue.global().async {
                if let data = try? Data(contentsOf: imageUrl) {
                    if let image = UIImage(data: data) {
                        DispatchQueue.main.async {
                            self.myImageView.image = image
                            self.myImageView.contentMode = .scaleAspectFit
//                            
//                            if let imageWidth = self.myImageView.image?.size.width, let imageHeight = self.myImageView.image?.size.height {
//                                let aspectRatio = imageHeight / imageWidth
//                                let newHeight = self.myImageView.frame.width * aspectRatio
//                                self.frame.size = CGSize(width: self.frame.width, height: newHeight)
//                            }
                        }
                    }
                }
            }
        }
    }
}
