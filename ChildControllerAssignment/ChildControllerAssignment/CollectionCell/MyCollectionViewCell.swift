//
//  MyCollectionViewCell.swift
//  ChildControllerAssignment
//
//  Created by Apurva Jalgaonkar on 06/11/23.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {

    @IBOutlet var imageName: UIImageView!
    
    static let identifier = "MyCollectionViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "MyCollectionViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    public func configure(with model: Model) {
        self.imageName.image = UIImage(named: model.imageName)
    }
    

}
