//
//  CustomCell.swift
//  TimeOffApp
//
//  Created by Jamile Castro on 15/06/22.
//

import UIKit

class CustomCell: UITableViewCell {
    
    @IBOutlet weak var cell: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
