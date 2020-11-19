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
    
    let animationView = UIView()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        
        if selected {
            UIView.animate(withDuration: 2.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: .curveEaseOut, animations: {self.imageGroup.frame.size = CGSize(width: 70, height: 70)}, completion: {_ in self.imageGroup.transform = .identity})
        }
    }

}
