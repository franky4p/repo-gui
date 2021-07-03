//
//  TableViewCell.swift
//  Timers
//
//  Created by Pavel Khlebnikov on 02.07.2021.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    var myTimer: MyTimer?
    weak var nameTimer: UILabel!
    weak var valueTimer: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "TableViewCell")
        
        let labelName = FactoryUI.createLabel(contentView, withX: 10, withY: 5, hight: 40, withBorder: false)
        self.nameTimer = labelName
        contentView.addSubview(labelName)
        
        let labelValue = FactoryUI.createLabel(contentView, withX: contentView.bounds.maxX - 10, withY: 5, hight: 40, withBorder: false)
        self.valueTimer = labelValue
        contentView.addSubview(labelValue)
    }
    
    required init?(coder: NSCoder) {
       fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.accessoryType = .none
    }
    
    func updateTime() {
        guard let timer = self.myTimer?.timer else { return }
        
        var time: Double = 0
        if self.myTimer?.timeUntilFire != nil {
            time = self.myTimer?.timeUntilFire ?? 0
        } else {
            time = timer.fireDate.timeIntervalSince(Date())
        }
        
        let hours = Int(time) / 3600
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        
        var times: [String] = []
        if hours > 0 {
            times.append("\(hours):")
        }
        if minutes > 0 {
            times.append("\(minutes):")
        }
        times.append("\(seconds)")
        
        valueTimer.text = times.joined(separator: "")
    }
}
