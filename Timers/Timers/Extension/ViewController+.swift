//
//  ViewController+.swift
//  Timers
//
//  Created by Pavel Khlebnikov on 03.07.2021.
//

import UIKit

extension ViewController {
    @objc func updateTimer() {
        guard let visibleRowsIndexPaths = tableView.indexPathsForVisibleRows else {return}
        
        for indexPath in visibleRowsIndexPaths {
            if let cell = tableView.cellForRow(at: indexPath) as? TableViewCell {
                cell.updateTime()
            }
        }
    }
    
    func createTimer() {
      if mainTimer == nil {
        mainTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        mainTimer?.tolerance = 0.1
      }
    }
    
}
