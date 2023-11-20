//
//  CustomTableViewCell.swift
//  ConcurrencyAssignment
//
//  Created by Apurva Jalgaonkar on 09/11/23.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var weather: UILabel!
    @IBOutlet weak var status: UILabel!
    @IBOutlet weak var result: UILabel!
    @IBOutlet weak var player_match: UILabel!
    @IBOutlet weak var league: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
