//
//  NumberTableViewCell.swift
//  Numbers
//
//  Created by Apurva Jalgaonkar on 11/10/23.
//



import UIKit

class NumberTableViewCell: UITableViewCell {
    @IBOutlet weak var numberLabel: UILabel!

    func configure(with number: NumberModel) {
        numberLabel.text = "\(number.number)"
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}

