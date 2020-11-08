//
//  TableViewCellGroup.swift
//  Task1
//
//  Created by macbook on 01.11.2020.
//

import UIKit

class TableViewCellGroup: UITableViewCell {

    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var imageGroup: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
